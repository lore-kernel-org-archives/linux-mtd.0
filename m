Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13WO3M-00020p-00
	for mtd-list@infradead.org; Tue, 05 Sep 2000 20:06:40 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13WO3K-00020j-00
	for mtd@infradead.org; Tue, 05 Sep 2000 20:06:38 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id OAA28913
	for <mtd@infradead.org>; Tue, 5 Sep 2000 14:06:01 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id OAA04802
	for <mtd@infradead.org>; Tue, 5 Sep 2000 14:06:01 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F0AC@txexmta8.amd.com>
To: mtd@infradead.org
Subject: offsetting fmc->flash_start to accommodate the BIOS
Date: Tue, 5 Sep 2000 14:05:55 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

in jffs_fm.c, line 53, flash_start is set to 0.  Will the flash
code still work if flash_start is set to some other value?  I
realize that flash_size would also need to be modified.

Or is there some better way to set up MTD/JFFS for a CFI flash
chip that has both BIOS and the root filesystem on it?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
