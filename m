Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1470Cu-0002IT-00
	for mtd-list@infradead.org; Fri, 15 Dec 2000 19:07:52 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1470Cs-0002IL-00
	for mtd@infradead.org; Fri, 15 Dec 2000 19:07:50 +0000
Received: from amdint2.amd.com (amdint2.amd.com [163.181.250.1])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id NAA02168
	for <mtd@infradead.org>; Fri, 15 Dec 2000 13:06:52 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id NAA29193
	for <mtd@infradead.org>; Fri, 15 Dec 2000 13:06:52 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F243@txexmta8.amd.com>
To: mtd@infradead.org
Subject: OOPS on AMD CFI chips
Date: Fri, 15 Dec 2000 13:06:43 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

	I generated an oops by copying a file.  Here's the oops
itself, followed by the assembly code immediately proceeding
the crash (from cfi_amdstd_write_bytes_32 in cfi_cmdset_0002.c).
	It looks to me like the crash is caused by edi being
0xC1000000.  Am I misinterpreting or should I follow up on this
more?

CPU:    0
EIP:    0010:[<c01a27fb>]
EFLAGS: 00010217
eax: 3fffffff   ebx: fffffffe   ecx: 3ffa2774   edx: 00000003
esi: c03445ec   edi: c1000000   ebp: 005cbd14   esp: c0e89dc8
ds: 0018   es: 0018   ss: 0018
Process cp (pid: 231, process nr: 35, stackpage=c0e89000)
Stack: 00000001 c003dad0 c0e89dd4 00ffffff 00000000 00000000 00000000
00000000
       00000000 00000000 00000000 00000000 c011b680 c014d760 00000000
00000000
       c014dbd0 c014ddd0 00000000 00000000 00000000 c014de00 00000000
00000000
Call Trace: [<c011b680>] [<c014d760>] [<c014dbd0>] [<c014ddd0>] [<c014de00>]
[<c014c1f0>] [<c014c490>]
       [<c014bff0>] [<c014d4f0>] [<c014c1f0>] [<c014c960>] [<c014cf90>]
[<c014c650>] [<c014c8f0>] [<c014ccd0>]
       [<c014bca0>] [<c014d2a0>] [<c014d3d0>] [<c014de10>] [<c014dff0>]
[<c014b790>] [<c014b710>] [<c014e050>]
       [<c014bbe0>] [<c01b4cea>] [<c014b590>] [<c014e090>]
Code: f3 a5 f6 c3 02 74 02 66 a5 f6 c3 01 74 01 a4 8b 74 24 2c e9
Unable to handle kernel paging request at virtual address 83d0ff28
current->tss.cr3 = 008e7000, %cr3 = 008e7000
*pde = 00000000


7ee:	movl		0x10(%esp, 1), %edi
7f2:  movl		0x28(%esp, 1), %esi
7f6:  movl		0x2c(%esp, 1), %ebx
7fa:  cld
7fb:  repz movsl	%ds:(%esi), %es(%edi)

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
