Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13UrTk-0007Oc-00
	for mtd-list@infradead.org; Fri, 01 Sep 2000 15:07:36 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13UrTj-0007OV-00
	for mtd@infradead.org; Fri, 01 Sep 2000 15:07:35 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id JAA07477
	for <mtd@infradead.org>; Fri, 1 Sep 2000 09:06:58 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id JAA22542
	for <mtd@infradead.org>; Fri, 1 Sep 2000 09:06:58 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F0A0@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Booting from CFI chips
Date: Fri, 1 Sep 2000 09:06:51 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Assuming I can get my BIOS to treat my flash array as a 
bootable device, how do I set up a flashable image so that
it will boot?  Do I use LILO, doc_loadbios, or some other
set of programs?  Nothing in the util or html directory
seems to address this issue directly.

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
