Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CMSl-0007qe-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 14:22:07 +0100
Received: from txn2-30.evoserve.com
	([210.16.11.30] helo=hut.evoserve.com ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13CMSi-0007qY-00
	for mtd@infradead.org; Wed, 12 Jul 2000 14:22:05 +0100
Message-ID: <396CB32B.F5BDE904@evoserve.com>
Date: Thu, 13 Jul 2000 02:04:27 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: Finn Hakansson <finn.hakansson@axis.com>
CC: mtd@infradead.org
Subject: Re: inode alignment in flash
References: <Pine.LNX.4.21.0007120844330.30364-100000@vvv.axis.se>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Finn Hakansson wrote:

>
> No, raw inodes in JFFS is not aligned on page boundaries. There
> is a definition in jffs_fm.h called JFFS_ALIGN_SIZE which is the
> alignment of all kinds of data on-flash. Currently JFFS_ALIGN_SIZE
> is set to 4 bytes. (The comments in the switch in jffs_scan_flash
> about blocks are a little obsolete. Sorry about that.)
>

I have already noticed that macro before but I had doubts when I came across
the comments when I dived deep into the code.

>
> Did I get this right? You first create a jffs image with mkfs.jffs
> which you are able to mount the first time. Then you write some more
> data to the flash device, while mounted, and everything is fine. When
> you then mount after doing these writes, it fails. Exactly where does
> the mount fail? Hmmm... Can you turn on the debug printouts and try
> to see what is going wrong?
>
> Best regards,
> Finn

Not quiet. I created a jffs image by using cat. When I mounted it the first
time I noticed that some inodes were already being discarded as invlaid . I
didnt write anything to it. After a long time and a lot of messages about
invalid checksums it successfuly mounts. I cd into the mounted fs and did an
"ls -l" in the directory. The file size for one file was wrong. It was the
file with the "invalid" inodes. When I unmount and then mount again it
simply fails.

Now I looked at the sources and noticed the patch about byteorder.... I
applied it and recompiled the kernel and now I can mount with no problems. I
cant write on it though, it just fails. I commented out the part that
restricts write to 512 and all but still it wont write. I will try turning
on debug and post a copy the output.

Thanks.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
