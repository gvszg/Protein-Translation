class Translation
  CODON_TO_PROTEIN = {
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  def self.of_codon(codens)
    CODON_TO_PROTEIN[codens]
  end

  def self.of_rna(rna)    
    expected = []
    rna_contain = []
    count = rna.length / 3
    
    count.times do
      rna_contain << rna.slice!(0..2)
    end

    rna_contain.each do |codons|
      expected << CODON_TO_PROTEIN[codons] until (codons.include?("UAA") || codons.include?("UAG") || codons.include?("UGA"))
    end

    return expected
  end
end