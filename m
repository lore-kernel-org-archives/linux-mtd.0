Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qHAB-0001gY-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 17:20:11 +0100
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14qHAA-0001gM-00
	for mtd@infradead.org; Thu, 19 Apr 2001 17:20:10 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id D0B7E1C8F1
	for <mtd@infradead.org>; Thu, 19 Apr 2001 18:19:47 +0200 (MET DST)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id SAA19792
	for <mtd@infradead.org>; Thu, 19 Apr 2001 18:19:31 +0200 (MET DST)
Date: Thu, 19 Apr 2001 18:18:58 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: MTD CVS and Official Kernel Tree
Message-Id: <20010419181031.18A9.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Am I right when I assume that the mtd cvs tree can be applied to a 2.4
kernel tree by coppying directories like this?

Mtd cvs ---------------> Kernel Tree

mtd/drivers/mtd -------> linux/drivers/mtd
mtd/fs ----------------> linux/fs
mtd/include -----------> linux/include

And then what about the mtd/kernel directory in the CVS ? 

Thanks,

-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
