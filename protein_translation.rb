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

  def self.of_rna(strand)    
    expected = []
    rna_contain = []
    count = strand.length / 3
    
    count.times do
      rna_contain << strand.slice!(0..2)
    end

    rna_contain.each do |codons|
      begin
        if CODON_TO_PROTEIN.keys.include?(codons)
          if CODON_TO_PROTEIN[codons] == "STOP"
            break
          end

          expected << CODON_TO_PROTEIN[codons]
          return expected
        end
      rescue => exception
        raise TranslationTest::InvalidCodonError
      end      
    end    
  end
end