Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yGUK-0002VP-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 16:41:44 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13yGUJ-0002VJ-00
	for mtd@infradead.org; Tue, 21 Nov 2000 16:41:43 +0000
Received: from odyssey.amd.com (odyssey.amd.com [163.181.250.8])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id KAA03196
	for <mtd@infradead.org>; Tue, 21 Nov 2000 10:41:00 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id KAA12634
	for <mtd@infradead.org>; Tue, 21 Nov 2000 10:41:00 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1D6@txexmta8.amd.com>
To: mtd@infradead.org
Subject: Debugging an oops
Date: Tue, 21 Nov 2000 10:40:52 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm repeatedly getting an oops message when working with
my flash driver.  I'm using JFFS and cfi_cmdset_0002.c on
AMD CFI flash, an AMD x86 processor, and a map driver of
my own design, based on the physical map driver and the
partition code.

This is a very reproducible oops.  After I create the
file image on flash, I can create or copy a single file.
Any additional attempts to create a file cause the oops.
I can, however, delete as many files as I want without
problems.

I'm not really sure how to go about debugging an oops.
Using printks to check-point the various functions obviously
doesn't work, so I'm rather stuck.  What's the preferred
procedure?

I'm including the oops message, posted below.  The EIP 
shows that the oops is occurring in my version of write32,
called from vsprintf(?) and cfi_amdext_write_bytes_32,
which is a little odd.

Can anyone provide any suggestions about what I can do to
get rid of this oops, or how I should go about debugging it?
Thank you.

Oops: 0002
CPU:    0
EIP:    0010:[<c01a657f>]
EFLAGS: 00010246
eax: c1800000   ebx: 01ec26ec   ecx: 00f000f0   edx: 01ec26ec
esi: c01d8980   edi: c0035be0   ebp: 00000002   esp: c0fbdd24
ds: 0018   es: 0018   ss: 0018
Process cp (pid: 243, process nr: 44, stackpage=c0fbd000)
Stack: 00f000f0 01ec26ec c0035c20 00000001 00000003 007b09bb 00000004
00000002
       c0035c30 02000064 c01a8bef ffffffff ffffffff ffffffff ffffff23
00000004
       c0fbdd70 00000000 c0035be0 c0fbc000 00000000 ffffffff ffffffff
ffffffff
Call Trace: [<c01a8bef>] [<c01a4656>] [<c01a47ab>] [<c01c2d60>] [<c01a61db>]
[<
       [<c014d0a3>] [<c012522b>] [<c014cdc0>] [<c0107bb8>]
Code: 89 0c 02 c3 8d b6 00 00 00 00 8d bc 27 00 00 00 00 57 56 8b
Aiee, killing interrupt handler
Scheduling in interrupt
Unable to handle kernel NULL pointer dereference at virtual address 00000000
current->tss.cr3 = 00101000, %cr3 = 00101000
*pde = 00000000

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
