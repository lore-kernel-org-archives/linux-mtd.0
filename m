Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qHGv-0001jI-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 17:27:09 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qHGp-0001jC-00
	for mtd@infradead.org; Thu, 19 Apr 2001 17:27:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010419181031.18A9.GAUTIER@email.enst.fr> 
References: <20010419181031.18A9.GAUTIER@email.enst.fr> 
To: Fabrice Gautier <gautier@email.enst.fr>
Cc: mtd@infradead.org
Subject: Re: MTD CVS and Official Kernel Tree 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Apr 2001 17:25:56 +0100
Message-ID: <5889.987697556@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gautier@email.enst.fr said:
> Am I right when I assume that the mtd cvs tree can be applied to a 2.4
> kernel tree by coppying directories like this?

> mtd/drivers/mtd -------> linux/drivers/mtd
> mtd/fs ----------------> linux/fs
> mtd/include -----------> linux/include

Yep. Assuming I got the Makefiles right. Which is unlikely. 

gautier@email.enst.fr said:
>  And then what about the mtd/kernel directory in the CVS ? 

Ignore it. It used to hold all the files which go into linux/drivers/mtd. 
Now it only contains two obsolete files.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
