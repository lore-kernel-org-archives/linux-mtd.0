Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KPl1-0007Tl-00
	for mtd-list@infradead.org; Thu, 03 Aug 2000 19:30:15 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13KPkz-0007TZ-00
	for mtd@infradead.org; Thu, 03 Aug 2000 19:30:14 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id NAA22375
	for <mtd@infradead.org>; Thu, 3 Aug 2000 13:29:41 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id NAA23346
	for <mtd@infradead.org>; Thu, 3 Aug 2000 13:29:40 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F02B@txexmta8.amd.com>
To: mtd@infradead.org
Subject: request module returns "root fs not mounted"
Date: Thu, 3 Aug 2000 13:29:38 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Forgive me if this is a FAQ, but I can't seem to find any
references to it.  I'm trying to set up some physically mapped
Flash on a SuSE 6.3 system.

When my system is starting up, I perform the do_map_cfi()
call before I mount the root filesystem.  request_module(cfi_probe)
returns "Root fs not mounted."

How can I make the kernel wait to mount the flash until after
the root filesystem is mounted?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
