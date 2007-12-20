Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5MeA-0002ZJ-I9
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 14:45:21 +0000
Message-ID: <476A7FF6.8010604@dave-tech.it>
Date: Thu, 20 Dec 2007 15:45:10 +0100
From: R&D4 <r&d4@dave-tech.it>
MIME-Version: 1.0
To: mtd_mailinglist <linux-mtd@lists.infradead.org>
Subject: NAND bad block: 1st or 2nd page?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear MTD Gurus,

I have a question about bad block management, especially regarding how 
NAND manifacturer mark bad blocks in factory and how MTD check this 
"marker".

Preamble: I will care only about small block NAND here, large block are 
a bit different in bad block management.

Reading your "NAND Flash FAQ" here:

http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_bootloader

I see this:

"They [factory-marked bad blocks] are marked in the 6th byte (offset 
0x5) in the out of band area of the first page of a block."

Looking (from an ignorant point of view like mine ;-) ) at the code 
inside drivers/mtd/nand_base.c, it seems that FAQ is correct and only 
this byte of the first page is checked (of course, correct me if I'm wrong).

On the other side I read carefully some NAND manifacturer datasheet 
(Samsung, ST and so on) I find the following:

* Samsung (Identifying Initial Invalid Block(s)):

"The initial invalid block(s) status is defined by the 6th byte in the 
spare area. Samsung makes sure that either the 1st or 2nd page of every 
initial invalid block has non-FFh data at the column address of 517."

* ST (bad block algorithm):

"Any block where the 6th Byte/ 1st Word in the spare area of the 1st or 
2nd page (if the 1st page is Bad) does not contain FFh is a Bad Block."

The "key words" here are "1st OR 2nd page".

It seems that manifacturer mark both or only one of these pages and that 
  software should check for two bytes: the 6th of the OOB of the first 
AND second page of each erase block. Only if both are equal to 0xFF it 
means that the block is NOT bad.

I found that, on the other side, Toshiba seems a bit different here:

"Read Check [for bad block]: to verify the column address 517 bytes of 
the first page in the block with FFh"

So.. with Toshiba NAND you need to check only the first page.

Am I missing something?
Do I misunderstood these datasheet or the FAQ are not correct?
How is this handled in nand_base.c? (I saw only 1 check for eraseblock)

Thanks in advance and Best Regards,

-- 

Andrea

DAVE Srl - Electronics System House
e-mail address: r&d4@dave-tech.it
