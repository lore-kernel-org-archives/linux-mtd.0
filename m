Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13jgQ6-0001Ku-00
	for mtd-list@infradead.org; Thu, 12 Oct 2000 12:21:06 +0100
Message-ID: <39E59F7B.C4AF2F28@gremlin.it>
Date: Thu, 12 Oct 2000 13:24:43 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org
Subject: Re: GRUB + DOC2000 = problems
References: <39E59C26.D3969B6@gremlin.it> <8032.971349255@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> gremlin@gremlin.it said:
> > note that i compile grub with --enable-minix and --enable-ext2fs in
> > the HD (primary/master) i have only one partition in ext2 ...
> 
> > what of wrong i'm doing ????
> 
> Did you apply the patches to Grub to provide DiskOnChip support?
> 
> --
> dwmw2

yes ...

mhhh from mtd/grub/README

1) build grub
2) copy pre_stage2 
3) make 

i did it ... what else i have to do ??? 



-- 
 /-----------------------------------------------------------------------\
|                 Alessandro Gardich : gremlin@gremlin.it                 |
 >-----------------------------------------------------------------------<
| Le aquile possono anche volare,                                         |
|                            ma le talpe non vengono risucchiate nei jet. |
|                                                                         |
|                                                                 "Micol" |
 \-----------------------------------------------------------------------/


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
