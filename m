Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RiZG-0002PD-00
	for mtd-list@infradead.org; Wed, 23 Aug 2000 23:00:18 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13RiZF-0002Ox-00
	for mtd@infradead.org; Wed, 23 Aug 2000 23:00:17 +0100
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id QAA17925
	for <mtd@infradead.org>; Wed, 23 Aug 2000 16:59:45 -0500 (CDT)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id QAA16873
	for <mtd@infradead.org>; Wed, 23 Aug 2000 16:59:45 -0500 (CDT)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F071@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Processor Specific Files
Date: Wed, 23 Aug 2000 16:59:43 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm using an Elan Sc520 with 16 megs of AMD CFI compliant 
flash on it.  The flash is arranged into two banks, each 
built from 4 interleaved 8-bit flash chips.  Each bank is 
separately mapped into physically memory using a Programmable 
Address Region (PAR), and the BIOS sets these up and makes 
them write-cacheable by default.

My problem is that the cfi_probe() code fails if the PARS 
are write-cacheable, since the return value of an earlier 
probe is cached, and then returned for the 4x8 probe.  It's 
possible to reprogram the PARs, but I'm not sure where to 
do it.  Should I put it in physmap.c, at the start of the
initialization routine?  Someplace else?  Create a specific
module for my processor and do it there?  What's the best
way to handle this?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
