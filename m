Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vjo5-0005w5-00
	for mtd-list@infradead.org; Tue, 14 Nov 2000 17:23:41 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vjo3-0005vz-00
	for mtd@infradead.org; Tue, 14 Nov 2000 17:23:39 +0000
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA09729
	for <mtd@infradead.org>; Tue, 14 Nov 2000 11:23:07 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA28370
	for <mtd@infradead.org>; Tue, 14 Nov 2000 11:23:06 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1B8@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Big Endian/Little Endian headache in cfi_cmdset_0002.c
Date: Tue, 14 Nov 2000 11:23:05 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

	The write code in cfi_amdext_write_bytes_32 uses
be32_to_cpu and cpu_to_be32 to make the last four or 
less bytes of a buffer Big Endian.  However, none of 
the other write or read code in cfi_cmdset_002 is 
concerned with Endianess, so it looks like (on my 
x86 chip) that the first x bytes of a write are
little endian, and then the last 3 or 4 are reversed.
	Is there some reason for handling things this
way, or is this a bug in the code?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
