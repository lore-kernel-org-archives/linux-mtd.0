Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13wUul-00082f-00
	for mtd-list@infradead.org; Thu, 16 Nov 2000 19:41:43 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13wUuk-00081g-00
	for mtd@infradead.org; Thu, 16 Nov 2000 19:41:42 +0000
From: mark.langsdorf@amd.com
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1C0@txexmta8.amd.com>
To: ahennessy@mvista.com
Cc: mtd@infradead.org
Subject: RE: Big Endian/Little Endian headache in cfi_cmdset_0002.c
Date: Thu, 16 Nov 2000 13:41:02 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> In data writes and reads, endianness should not be a concern 
> except for the unaligned bytes which should follow the
> cfi_cmdset_0001.c code example instead of the assumption of
> a particular endianness that exists now in cfi_amdext_write_bytes_32.

	I'm not sure what you mean - as far as I can tell,
cfi_cmdset_0001.c does deal with endianness except in 3
specific incidences, two of which cfi_cmdset_0002.c doesn't
use and the third which we don't currently implement (but
should, and probably could trivially).
	Is there something else I am missing, or can I take
all these endian references out of my code with a clear
conscience?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com
	



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
