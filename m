Received: from orngca-mls02.socal.rr.com ([66.75.160.17])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q2Pw-0003KM-8R
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 11:01:21 +0100
Received: from [192.168.2.5] (66-75-241-113.san.rr.com [66.75.241.113])
	h5B9wNv19120	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 02:58:23 -0700 (PDT)
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1055322085.31819.31.camel@localhost3.localdomain>
References: <1055118239.10424.49.camel@localhost3.localdomain>
	 <1055322085.31819.31.camel@localhost3.localdomain>
Message-Id: <1055325700.28330.40.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 11 Jun 2003 03:01:40 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with using doc2001 module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

here's the oops quickly decoded:

Unable to handle kernel NULL pointer dereference at virtual address
00000000
fdc8145a
*pde = 00000000
Oops: 0000
CPU:    1
EIP:    0010:[<fdc8145a>]    Tainted: P
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010046
eax: 00000000   ebx: f6d94000   ecx: 8000384c   edx: 00000000
esi: 00000000   edi: 00000292   ebp: 00000000   esp: f6d95e80
ds: 0018   es: 0018   ss: 0018
Process insmod (pid: 2126, stackpage=f6d95000)
Stack: fdc80ae1 00000000 00000000 fdea2000 00201000 f6db2de0 00000000
f6db2de0
000001f0 f6f9828c 00200000 ffe00000 ffffffff 00000000 c0118bc1 00200000
00000001 00000000 c011f3e0 ffffffea 00000000 00000000 00000000 fdc80df8
Call Trace: [<fdc80ae1>]  [<c0118bc1>]  [<c011f3e0>]  [<fdc80df8>] 
[<fdc809c0>]  [<fdc83140>]  [<fdc7f0b3>]  [<fdc83000>]  [<fdc825ca>] 
[<c0120634>]  [<fdc7f060>]  [<fdc7f060>]  [<c010787f>]
Code: 0f b6 04 10 0f b6 c0 c3 8d b4 26 00 00 00 00 8d bc 27 00 00


>>EIP; fdc8145a <END_OF_CODE+7598f/????>   <=====

>>ebx; f6d94000 <_end+3695ea1c/3c40ca7c>
>>esp; f6d95e80 <_end+3696089c/3c40ca7c>

Trace; fdc80ae1 <END_OF_CODE+75016/????>
Trace; c0118bc1 <__ioremap+d1/130>
Trace; c011f3e0 <printk+140/1b0>
Trace; fdc80df8 <END_OF_CODE+7532d/????>
Trace; fdc809c0 <END_OF_CODE+74ef5/????>
Trace; fdc83140 <END_OF_CODE+77675/????>
Trace; fdc7f0b3 <END_OF_CODE+735e8/????>
Trace; fdc83000 <END_OF_CODE+77535/????>
Trace; fdc825ca <END_OF_CODE+76aff/????>
Trace; c0120634 <sys_init_module+504/690>
Trace; fdc7f060 <END_OF_CODE+73595/????>
Trace; fdc7f060 <END_OF_CODE+73595/????>
Trace; c010787f <system_call+33/38>

Code;  fdc8145a <END_OF_CODE+7598f/????>
00000000 <_EIP>:
Code;  fdc8145a <END_OF_CODE+7598f/????>   <=====
   0:   0f b6 04 10               movzbl (%eax,%edx,1),%eax   <=====
Code;  fdc8145e <END_OF_CODE+75993/????>
   4:   0f b6 c0                  movzbl %al,%eax
Code;  fdc81461 <END_OF_CODE+75996/????>
   7:   c3                        ret
Code;  fdc81462 <END_OF_CODE+75997/????>
   8:   8d b4 26 00 00 00 00      lea    0x0(%esi,1),%esi
Code;  fdc81469 <END_OF_CODE+7599e/????>
   f:   8d bc 27 00 00 00 00      lea    0x0(%edi,1),%edi


-- 

Roger
http://www.eskimo.com/~roger/index.html
