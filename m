Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jgax-0001MR-00
	for mtd-list@infradead.org; Thu, 12 Oct 2000 12:32:19 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13jgaw-0001ML-00
	for mtd@infradead.org; Thu, 12 Oct 2000 12:32:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39E59F7B.C4AF2F28@gremlin.it> 
References: <39E59F7B.C4AF2F28@gremlin.it>  <39E59C26.D3969B6@gremlin.it> <8032.971349255@redhat.com> 
To: Alessandro GARDICH <gremlin@gremlin.it>
Cc: mtd@infradead.org, Volker Sonn <mlist@sonn-online.de>
Subject: Re: GRUB + DOC2000 = problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 12 Oct 2000 12:26:46 +0100
Message-ID: <9826.971350006@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


gremlin@gremlin.it said:
> yes ... 

gremlin@gremlin.it said:
> > note that i compile grub with --enable-minix and --enable-ext2fs in
> > the HD (primary/master) i have only one partition in ext2 ...

You also have to compile Grub with --enable-diskonchip

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
