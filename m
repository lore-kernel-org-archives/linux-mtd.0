Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SMFP-0001Is-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 17:22:27 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13SMFN-0001Im-00
	for mtd@infradead.org; Fri, 25 Aug 2000 17:22:25 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA15118
	for <mtd@infradead.org>; Fri, 25 Aug 2000 11:21:53 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA11456
	for <mtd@infradead.org>; Fri, 25 Aug 2000 11:21:53 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F080@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Simple Newbie Questions for MTD and JFFS
Date: Fri, 25 Aug 2000 11:21:49 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

After a lot of running around in circles and poking at the
code, I've finally gotten my AMD-CFI flash bank to mount 
with jffs.  That's great, but now what do I do?

If I copy a file directly into the mount point, it doesn't
show up the next time I mount the flash.  If I use mkfs.jffs
to create an image and copy that into flash, I can see the
image but I can't access the files that I put into it.

I guess I'm asking if there's any documentation or hints on
how to use the files in the util/ directory, as well as how
mtd and jffs are supposed to work once they've mounted.

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
