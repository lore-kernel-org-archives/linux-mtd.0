Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13vnyQ-0007Ok-00
	for mtd-list@infradead.org; Tue, 14 Nov 2000 21:50:38 +0000
Received: from gateway-490.mvista.com ([63.192.220.206] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13vnyP-0007Oe-00
	for mtd@infradead.org; Tue, 14 Nov 2000 21:50:37 +0000
Message-ID: <3A11B3BE.B4987B74@mvista.com>
Date: Tue, 14 Nov 2000 13:50:54 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mark.langsdorf@amd.com
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: Big Endian/Little Endian headache in cfi_cmdset_0002.c
References: <0FA1031B65A9D111960900805F9FA8E103B9F1B8@txexmta8.amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

mark.langsdorf@amd.com wrote:

>         The write code in cfi_amdext_write_bytes_32 uses
> be32_to_cpu and cpu_to_be32 to make the last four or
> less bytes of a buffer Big Endian.  However, none of
> the other write or read code in cfi_cmdset_002 is
> concerned with Endianess, so it looks like (on my
> x86 chip) that the first x bytes of a write are
> little endian, and then the last 3 or 4 are reversed.
>         Is there some reason for handling things this
> way, or is this a bug in the code?
>
> Mark Langsdorf
> Advanced Micro Devices, Inc             Tel: 512.602.3756
> 5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
> Austin, TX 78741                        mark.langsdorf@amd.com
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

I'm also having to alter cfi_cmdset_0002.c for big endianness -  I think
we should use
cfi_write and cfi_read functions that cfi_cmdset_0001.c uses  but alter
them to take care
of both be32_to_cpu and le32_to_cpu (depending on a define) to take care
of both endiannesses.
This would isolate both the bus width issue and the endianness in these
2 functions.   In other words, move the
endianness out of cfi_build_cmd and put it into cfi_read and
cfi_write.   Also,  the handling
of unaligned bytes in cfi_cmdset_0001. c is good for both
endiannesses.   We should use this
method in cfi_cmdset_0002.c

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
