Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aXjI-0005pv-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 06:47:24 +0000
Received: from shell9.ba.best.com ([206.184.139.140] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aXjH-0005pp-00
	for mtd@infradead.org; Wed, 07 Mar 2001 06:47:23 +0000
From: Subodh Nijsure <subodh@best.com>
Message-Id: <200103070646.WAA09143@shell9.ba.best.com>
Subject: Re: AW: JFFS on a powerpc platform.
In-Reply-To: <BKEKLBIBFPNGJKJDEODFCECGEIAA.schirmer@taytron.net> from Florian Schirmer / TayTron at "Mar 7, 1 07:31:52 am"
To: schirmer@taytron.net (Florian Schirmer / TayTron)
Date: Tue, 6 Mar 2001 22:46:43 -0800 (PST)
Cc: subodh@best.com, mtd@infradead.org, jffs-dev@axis.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Hi!
> 
> >Question I have is -- has anyone tested JFFS on powerpc platform.
> >
> >I have retrieved the latest mtd code from CVS repository and
> >the data read back from flash is not "correct".
> >
> >The platform I am running on MPC860 based board having
> >intel flash  which mtd is able to recognize correctly.
> 
> Yes the code runs fine - now. Please check wether you are using at least
> version 1.10 of physmap.c. We fixed exactly this problem mhhh let me say
> around 4 days ago. Did you checked out the source after that? Please
> checkout again.
> 
> Hope that helps - if not please provide a DEBUG_CFI enabled output.

I got the latest code and one of the problem is fixed now. 

i.e. if I copy a file to jffs partition I can read back the content.

However if I mount partiton, copy a file to it, then unmount it and again
mount it, I don't see the file I copied.

e.g. I do

mount -t jffs /dev/mtdblock4 /tmp/jffs 
cp /etc/inetd.conf /tmp/jffs/inetd.conf

Now I do diff between /etc/inetd.conf and /tmp/jffs/inetd.conf both are
same files

Now I do umount and re-mount 
i.e.
umount jffs /dev/mtdblock4 
mount -t jffs /dev/mtdblock4 /tmp/jffs 

Now when I try to do ls -l /tmp/jffs I don't see the file I had copied earlier,
anybody seen this?

Thanks.

/Subodh Nijsure



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
