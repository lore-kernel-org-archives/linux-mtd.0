Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qfWd-0000lu-00
	for mtd-list@infradead.org; Tue, 31 Oct 2000 17:48:43 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13qfWb-0000lo-00
	for mtd@infradead.org; Tue, 31 Oct 2000 17:48:41 +0000
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA21988
	for <mtd@infradead.org>; Tue, 31 Oct 2000 11:48:09 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA26346
	for <mtd@infradead.org>; Tue, 31 Oct 2000 11:48:08 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F191@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Problems with AMD CFI chips
Date: Tue, 31 Oct 2000 11:47:59 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm testing the MTD/JFFS combo using Kernel 2.2.16 and
the October 30, 2000 version of MTD on AMD CFI compliant
chips.

The Flash bank is found correctly, and loads, and I can
write to it.  However, when I boot from it, I can't seem
to get it to commit writes - either creating new files 
or altering old ones.  Once I reboot the device, my
changes are gone.

mtab shows the root device as being mounted read/write.
When I write a file, the debug info seems to indicate
that the version numbers are being updated properly.

What other information should I provide to help debug
this problem?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
