Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEHYV-0003Sm-Te
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 01:50:07 +0100
Mime-Version: 1.0
Message-Id: <a0600200abca4d9eb4609@[130.161.115.44]>
In-Reply-To: <20040415222525.548414E20@blood.actrix.co.nz>
References: <a06002006bca469e103ce@[130.161.115.44]>
 <20040415222525.548414E20@blood.actrix.co.nz>
Date: Fri, 16 Apr 2004 02:50:02 +0200
To: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
Subject: Re: NAND bad blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 10:35 AM +1200 16/4/04, Charles Manning wrote:
>On Friday 16 April 2004 04:39, J.D. Bakker wrote:

[Recap: I noticed that mtd considers a NAND block to be bad if byte 5 
of the OOB data has one or more zero-bits in it; YAFFS looks for two 
or more zero-bits before considering a block to be damaged]

>The idea with the bit counting in YAFFS is to prevent a single bad bit
>causing a block to be erroneously marked bad, thereby losing your data.

Fair enough, but...

>In reality this situation hardly ever, if ever, arises and the two code
>sequences are pretty much equivalent.

I have a Flash device which has a block which triggers this boundary 
condition, resulting in a

"nand_erase: attempt to erase a bad block at page 0x00000420"

when running mkyaffs.

Maybe it would be a good idea to have mkyaffs be more conservative, 
ie adhere to the 'one strike out' policy when erasing a chip. 
Something like:

   if(oobbuf[5] != 0xFF)
   {
     oobbuf[5] = BAD_BLOCK_MARKER_WHICH_IS_ACCEPTED_BY_BOTH_MTD_AND_YAFFS;
     write_oob_to_nand(oobbuf);
   }

Does that look reasonable ? I'd expect it to be likely for a block 
with a single-bit error in the OOB to be going bad RSN anyway; might 
as well mark it bad when there's no user data to be lost.

JDB
[yes, I know, -ENOPATCH. Excuses:
* I don't know the NAND code well enough to pick a good value for 
BAD_BLOCK_MARKER
* it's WAY past my bedtime, especially since the UPS guy has a nice 
little wake-up call planned for me]
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
