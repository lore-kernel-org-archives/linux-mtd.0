Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 134fzj-0001Yr-00
	for mtd-list@infradead.org; Wed, 21 Jun 2000 09:36:23 +0100
Received: from mail.auriga.ru ([213.24.209.102])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 134fzi-0001Yl-00
	for mtd@infradead.org; Wed, 21 Jun 2000 09:36:22 +0100
Message-ID: <39507ED5.6713CE3C@auriga.ru>
Date: Wed, 21 Jun 2000 12:37:42 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: =?koi8-r?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
CC: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect
References: <394F7351.BC878E0D@auriga.ru> <394F88B3.1C046375@matrox.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Sébastien Côté wrote:

> Nick Ivanter wrote:
>
> > I've compiled JFFS and MTD into the kernel and tried to play with it on
> > the mtdram device. It seems to work, but when I tried to mount device
> > without manually specifying a filesystem type, I got error: "Unable to
> > handle kernel NULL pointer dereference at virtual address ...........
> > Process mount........... Segmentation fault". When specifying -t jffs,
> > everything seems to be ok.
> > Does anyone have ideas about what may cause that?
>
> hmm.... when I try the same thing I get :
> mount: you must specify the filesystem type
>
> I get the same output with -t auto.....  try using -t auto and see if it
> segfaults.
>
> --
> Sébastien Côté

I've tried it. mount with -t auto segfaults in the same way.

But I noticed interesting thing: when I then try to mount it for the first
time either with -t auto or not, I get the error immediately after entering
the command. But when I try it for the second time (again doesn't matter
specifying -t auto or not), I get debugging output from the mtdblock before
the error message:

bash# mount /dev/mtd0 /mnt -t auto
mtdblock_open
ok
Unable to handle kernel NULL pointer dereference at virtual address 0000000c

current->tss.cr3 = 01676000, %cr3 = 01676000
*pde = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c014cd43>]
EFLAGS: 00010092
..................
.................

Starting the third time and till reset, mounting /dev/mtd0 without
specifying filesystem type or with -t auto doesn't cause segfault:

bash# mount /dev/mtd0 /mnt
mtdblock_open
ok
mtdblock_release
ok
mount: you must specify the filesystem type



Nick.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
