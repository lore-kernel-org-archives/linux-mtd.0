Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FNtc-0001Ui-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 22:30:20 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FNtb-0001UW-00
	for mtd@infradead.org; Thu, 20 Jul 2000 22:30:19 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id QAA05921
	for <mtd@infradead.org>; Thu, 20 Jul 2000 16:29:43 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id QAA03143
	for <mtd@infradead.org>; Thu, 20 Jul 2000 16:29:42 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9EFEF@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Jedec.c problems in mtd-20000704
Date: Thu, 20 Jul 2000 16:29:36 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm sorry if this got patched in the latest CVS, but my
employer's proxy does not seem to support CVS, or perhaps
vice versa, so I have to use the latest tarball.

I've been having some problems with the 20000704 tarball in 
regards to jedec.c - first, I can't find a configuration
option that sets a symbol to compile jedec.c, and the Makefile
(in kernel) doesn't seem to have a rule to compile it.  I've
fixed that, but I wasn't sure if that was intentional or not.

Second, jedec.c (v 1.1) uses several members of the map_info 
structure that are no longer in the map_info structure.  
bus_width and band_size exist in the 1.4 version, but only 
buswidth exists in the 1.5 version.  Is there a suggested way 
to handle this change?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
