Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bLiL-0007KX-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 12:09:45 +0000
Received: from enst.enst.fr ([137.194.2.16])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14bLiJ-0007KR-00
	for mtd@infradead.org; Fri, 09 Mar 2001 12:09:44 +0000
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by enst.enst.fr (Postfix) with ESMTP id 765001C8FA
	for <mtd@infradead.org>; Fri,  9 Mar 2001 13:09:21 +0100 (MET)
Received: from FABRICE (droopy.maisel1.rezel.enst.fr [137.194.8.239])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id NAA10893
	for <mtd@infradead.org>; Fri, 9 Mar 2001 13:09:19 +0100 (MET)
Date: Fri, 09 Mar 2001 13:08:28 +0100
From: Fabrice Gautier <gautier@email.enst.fr>
To: mtd@infradead.org
Subject: Re: Macronix 29F1610 support
In-Reply-To: <20010308233010.A37B.GAUTIER@email.enst.fr>
References: <20010308233010.A37B.GAUTIER@email.enst.fr>
Message-Id: <20010309125507.A488.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 08 Mar 2001 23:56:35 +0100
Fabrice Gautier <gautier@email.enst.fr> wrote:

> Hi,
> 
> I trying to boot linux with a root filesystem on this Macronix NOR flash.

The datasheet for a M29F1610A (my flash is M29F1610-MC but i guess its
the same - except the capacity) says it uses JEDEC commands.

I've seen a jedec.c file in the source; but i'm not with which mtd driver
uses this file. Also, a comment in this file says i support only 8bit
flash chips, but the datasheet talk about 2Mx8 or 1Mx16 chips.


(see http://www.macronix.com/web/P_FLASH.nsf/bf3add4f68988391c825667100209fa5/42fce534dc51d8e8482569d10007e18d?OpenDocument
for the Datasheet) 
-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
