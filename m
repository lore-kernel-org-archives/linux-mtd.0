Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rQlp-0007Ur-00
	for mtd-list@infradead.org; Sun, 22 Apr 2001 21:47:49 +0100
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14rQlo-0007Ul-00
	for mtd@infradead.org; Sun, 22 Apr 2001 21:47:48 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id AE3861C8C9
	for <mtd@infradead.org>; Sun, 22 Apr 2001 22:47:42 +0200 (MET DST)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id WAA06108
	for <mtd@infradead.org>; Sun, 22 Apr 2001 22:47:23 +0200 (MET DST)
Date: Sun, 22 Apr 2001 22:46:54 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: JEDEC and MX29F1610 flash question
Message-Id: <20010422223725.1FE5.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

In jedec.c jedec_probe8 uses this sequence to reset and get the device
ID of the flash:

   // Reset the chip
   flwrite(Reset,0x555); 
   
   // Send the sequence
   flwrite(AutoSel1,0x555);
   flwrite(AutoSel2,0x2AA);
   flwrite(AutoSel3,0x555);
  

My flash which is a Macronix MX29F1610MC claim to be JEDEC compatible
but both the sample code and the datasheet of the MX29F1610A (which
should be pretty close to mine) seems to say that the good sequence is:

   // Reset the chip
   flwrite(AutoSel1,0x5555);
   flwrite(AutoSel2,0x2AAA);
   flwrite(Reset,0x5555); 
   
   // Send the sequence
   flwrite(AutoSel1,0x5555);
   flwrite(AutoSel2,0x2AAA);
   flwrite(AutoSel3,0x5555);

Two thing are differents:
First the adress are 5555 and 2AAA instead of 555 and 2AA
Then the Reset sequence require Three writes , not one.

Can someone explain this odd things to me?
Are Macronix flash not really JEDEC compatible?
Or is there some tricks in adress translations so that 555 = 5555 and
2AA = 2AAA ??

I've also seen a macronix entry int some table so i gues someone played
with one.

Thanks

-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
