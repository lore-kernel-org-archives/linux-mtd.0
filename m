Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rV4K-0001SL-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 02:23:12 +0100
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14rV4J-0001SF-00
	for mtd@infradead.org; Mon, 23 Apr 2001 02:23:11 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id 828E31C8C9
	for <mtd@infradead.org>; Mon, 23 Apr 2001 03:23:05 +0200 (MET DST)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id DAA19614
	for <mtd@infradead.org>; Mon, 23 Apr 2001 03:22:46 +0200 (MET DST)
Date: Mon, 23 Apr 2001 03:22:14 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: STPC and Macronix Flash.
Message-Id: <20010423030902.1FEC.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I have this cutom STPC board with this odd Macronix Flash (MX29F1610)
i'm trying to deal with. So i've tried to write an mtd driver for this.
For now the driver should just try to read the Device ID.

First problem is: In order to enable the flash i have to write in an
STPC register (a RAM controller register) which open a memory hole.

Then the flash should be mapped to 0x2a00000 so i'm doing an ioremap and
using the return value to access the flash. Just like it is done in
physmap.c and oher.

But I can't even get anything. The sample code from Macronix I'm using
gave good result an VxWorks and eCos. I personnally tested the code for
eCos so i'm quite sure i'm doing the right thing from the flash point of
view, but i'm thinking that maybe i get something wrong with the virtual
memory mapping. (There's no virtual memory stuff in eCos so it's very
simple)

And anyway is it really safe to manipulate the RAM controller in the mtd
driver? Didn't that would mess up with linux virtual memory managment?

Is there anyone doing things like that with an STPC ?

Thanks

-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
