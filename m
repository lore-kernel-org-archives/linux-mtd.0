Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECUP-0007EV-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 16:07:25 +0100
Received: from mail.auriga.ru ([213.24.209.102])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ECUO-0007EE-00
	for mtd@infradead.org; Mon, 17 Jul 2000 16:07:24 +0100
Message-ID: <39732117.94E3C0BB@auriga.ru>
Date: Mon, 17 Jul 2000 19:07:03 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: =?koi8-r?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
CC: mtd@infradead.org
Subject: Re: Compiling MTD in the kernel
References: <39731CC4.65600194@matrox.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

You probably did not patch init/main.c and fs/filesystems.c to call
init_mtd() and init_jffs_fs() correspondingly.


Nick.

Sébastien Côté wrote:

> Hi,
>
> I just tried to compile MTD in the kernel (not as a module) btu, even if
> everything compiles fine, it doesn't work.  If I try to cat a jffs image
> in /dev/mtd0 (I use mtdram), I get:
>
> bash: /dev/mtd0: No such device.
>
> If I try to mount a partition using jffs (even though this partition
> isn't jffs), I get:
> mount: fs type jffs not supported by kernel
>
> It's the same errors I would get If I had compiled everything as modules
> but didn't load them.
>
> Any clue?
>
> --
> Sébastien Côté
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
