Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qLAO-0004vC-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 21:36:40 +0100
Received: from stm.lbl.gov ([131.243.16.51] ident=mail)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qLAM-0004v4-00
	for mtd@infradead.org; Thu, 19 Apr 2001 21:36:39 +0100
Date: Thu, 19 Apr 2001 13:35:54 -0700
From: David Schleef <ds@schleef.org>
To: Fabrice Gautier <gautier@email.enst.fr>
Cc: mtd@infradead.org
Subject: Re: MTD CVS and Official Kernel Tree
Message-ID: <20010419133554.A31173@stm.lbl.gov>
Reply-To: David Schleef <ds@schleef.org>
References: <20010419181031.18A9.GAUTIER@email.enst.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010419181031.18A9.GAUTIER@email.enst.fr>; from gautier@email.enst.fr on Thu, Apr 19, 2001 at 06:18:58PM +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, Apr 19, 2001 at 06:18:58PM +0200, Fabrice Gautier wrote:
> Hi,
> 
> Am I right when I assume that the mtd cvs tree can be applied to a 2.4
> kernel tree by coppying directories like this?
> 
> Mtd cvs ---------------> Kernel Tree
> 
> mtd/drivers/mtd -------> linux/drivers/mtd
> mtd/fs ----------------> linux/fs
> mtd/include -----------> linux/include
> 
> And then what about the mtd/kernel directory in the CVS ? 


Funny you should mention this, as I just set up my autobuilder
yesterday to create a kernel patch nightly from the latest CVS and
the latest kernel.  I'm using it for other autobuilding purposes,
but I can have it upload the patches somewhere useful it people
are interested.




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
