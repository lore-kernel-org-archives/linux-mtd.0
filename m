Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 130HYw-0005K4-00
	for mtd-list@infradead.org; Fri, 09 Jun 2000 06:42:34 +0100
Date: Thu, 8 Jun 2000 23:42:22 -0600 (MDT)
From: Jason Gunthorpe <jgg@deltatee.com>
To: Bjorn Wesen <bjorn.wesen@axis.com>
cc: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org,
    jffs-dev@axis.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
In-Reply-To: <Pine.LNX.3.96.1000606010429.10303G-100000@fafner.axis.se>
Message-ID: <Pine.LNX.3.96.1000608233858.25251A-100000@white.priv.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 6 Jun 2000, Bjorn Wesen wrote:

> It's because when you build an embedded product, you typically don't build
> it on the target, so you have no way of mounting and populating it. You
> should see mkfs.jffs more as a "filesystem cross compiler" than an mkfs
> tool (as Finn wrote, there is no need for a "real" mkfs.jffs - an empty
> flash will do).

Wow, that is really great. Right now with the FFS2 stuff I am using we
have to have a FFS2 module installed on the host to populate the file
system image, it kind of sucks in alot of ways.

> One drawback code-wise is that there is redundancy between code in
> mkfs.jffs and in the filesystem itself of course. But the on-flash
> node-structure of JFFS is so simple that mkfs.jffs is simple enough to
> warrant it I think.

Is the on flash structure documented? I need to write a simple read-only
driver for bootloaders. (see the boot stuff in MTD CVS, if it is still the
things I cooked up..)

There is a very good chance I am going to ditch FFS2 and just use JFFS for
all our products, I don't really like writing filesystem code and JFFS
sounds all round better than what MS came up wtih [FFS2 has inherent
consistency issues] :>

Thanks,
Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
