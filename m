Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECTb-0007E4-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 16:06:35 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ECTa-0007Dy-00
	for mtd@infradead.org; Mon, 17 Jul 2000 16:06:34 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id KAA26911
	for <mtd@infradead.org>; Mon, 17 Jul 2000 10:06:01 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id KAA05662
	for <mtd@infradead.org>; Mon, 17 Jul 2000 10:06:01 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9EFD6@txexmta8.amd.com>
To: mtd@infradead.org
Subject: RE: Compiling MTD in the kernel
Date: Mon, 17 Jul 2000 10:05:55 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> If I try to mount a partition using jffs (even though this partition
> isn't jffs), I get: mount: fs type jffs not supported by kernel

	Are you using the 2.2.16 patch of the 2000/07/04 build?  I am
having a similar problem, and it looks like the patch does not set up
the make files properly to handle the jffs stuff.  At least, the jffs
is not an option with 'make menuconfig' even though the other MTD 
stuff is.
 
> It's the same errors I would get If I had compiled everything 
> as modules but didn't load them.

-Mark Langsdorf


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
