Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Rzl5-0005QQ-00
	for mtd-list@infradead.org; Thu, 24 Aug 2000 17:21:39 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Rzl4-0005QK-00
	for mtd@infradead.org; Thu, 24 Aug 2000 17:21:38 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA03429
	for <mtd@infradead.org>; Thu, 24 Aug 2000 11:21:05 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id LAA21424
	for <mtd@infradead.org>; Thu, 24 Aug 2000 11:21:05 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F079@txexmta8.amd.com>
To: mtd@infradead.org
Subject: RE: The archives [looking for info on AM29LV640 flash]
Date: Thu, 24 Aug 2000 11:21:03 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>  I've been browsing the archive to see if anyone's used MTD on
> AM29LV640 (64Mb, NAND I believe) parts.

	The spec sheet for the Am29LV640 indicates they are CFI
parts.  You should be able to use the cfi_cmdset_0002 module
with them, though admittedly I haven't tested this myself.

-Mark Langsdorf
AMD, Inc.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
