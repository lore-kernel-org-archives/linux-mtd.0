Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pvTh-0007UL-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 18:10:53 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pvTg-0007UD-00
	for mtd@infradead.org; Wed, 18 Apr 2001 18:10:53 +0100
Message-ID: <3ADDCACB.15BF0590@daniel.com>
Date: Wed, 18 Apr 2001 12:11:39 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: joakim.tjernlund@lumentis.se
CC: mtd@infradead.org
Subject: Re: JFFS2 as root FS
References: <001001c0c826$63b43200$0a01a8c0@Win1>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Joakim Tjernlund wrote:

> Hi there
>
> Has anybody managed to get a root FS with JFFS2 to work?

Sure! But as you say that you followed the HOWTO, and since I wrote the
HOWTO,
I guess that something in my procedures tripped you up that worked ok for
me :)


>
> I followed the mtd howto and I have a root partition(with the necessary
> files) and
> all I get is: "Kernel panic: I have no root and I want to scream"
> message.

Hmm, what kernel version are you using? I've never seen that message (I've
seen Kernel panic: Unable to open root..blah blah..)


>
>
> first I tried to use "rdev zvmlinux /dev/mtdblock1", but
> the kernel ignored that an did a NFS mount as usual.

Wait, wait, wait. What do you mean by this? This is *a problem* right
here.

Why is it doing a NFS mount? Please describe your config and what you are
trying to do.
"usual" kernels don't NFS mount their root fs!



> I then
> specified on the kernel commad line: root=/dev/mtdblock1
> and the I got the kernel panic above.

Well, the kernel may not be able to understand the "mtdblock1" device by
name unless you patched
the init/main.c file to list a conversion table from mtdblockxx to a
*device number*.


>
>
> Any Ideas?

These are some.

Vipin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
