Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b9Lj-0004IJ-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 22:57:35 +0000
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14b9Li-0004ID-00
	for mtd@infradead.org; Thu, 08 Mar 2001 22:57:34 +0000
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id DB08D1C907
	for <mtd@infradead.org>; Thu,  8 Mar 2001 23:57:30 +0100 (MET)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id XAA23105
	for <mtd@infradead.org>; Thu, 8 Mar 2001 23:57:30 +0100 (MET)
Date: Thu, 08 Mar 2001 23:56:35 +0100
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: Macronix 29F1610 support
Message-Id: <20010308233010.A37B.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I trying to boot linux with a root filesystem on this Macronix NOR flash.

I've my hand on some source code form Macronix that allows me program
the flash, but im not sure there is any CFI compliance in this. It's not
that i know a lot about CFI or am used to flash memories but i didn't
see strong evidences in the code.

In my case reading is mapped to a fixed physical address, and writing
needs

Also I've looked at the "Support for ROM chips in bus mapping" but i'm
not sure this is what i'm looking for.

Does anybody knows if this flash is compatible with some other vendors? 
Is there some kind of autodetection for those chips?

On another topic, how are defined device numbers for the flash drivers?

Thanks
-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
