Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jgKm-0001I8-00
	for mtd-list@infradead.org; Thu, 12 Oct 2000 12:15:36 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13jgKk-0001I2-00
	for mtd@infradead.org; Thu, 12 Oct 2000 12:15:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39E59C26.D3969B6@gremlin.it> 
References: <39E59C26.D3969B6@gremlin.it> 
To: Alessandro GARDICH <gremlin@gremlin.it>
Cc: mtd@infradead.org
Subject: Re: GRUB + DOC2000 = problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Oct 2000 12:14:15 +0100
Message-ID: <8032.971349255@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gremlin@gremlin.it said:
> note that i compile grub with --enable-minix and --enable-ext2fs in
> the HD (primary/master) i have only one partition in ext2 ...

> what of wrong i'm doing ????  

Did you apply the patches to Grub to provide DiskOnChip support?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
