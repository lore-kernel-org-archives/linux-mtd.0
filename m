Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yFS2-0007Gk-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2001 16:39:51 +0000
Received: from localhost (rob@localhost)
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id f9TGn5424680
	for <linux-mtd@lists.infradead.org>; Mon, 29 Oct 2001 17:49:05 +0100
Date: Mon, 29 Oct 2001 17:49:04 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: linux-mtd@lists.infradead.org
Subject: jedec_probe not honoring map_info.size ?
Message-ID: <Pine.LNX.4.21.0110291727110.23295-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I have an Intel E28F016S3 (2MB) Flash chip which I'm trying
to do MTD support for. When I install my driver, I get the
following:

<---------------------------------------------------->
dnpc flash device: 200000 at 2000000
Flash mapped to c1000000   <-- this is returned from ioremap()
CFI: Found no dnpc Flash Bank device at location zero
Unable to handle
kernel paging request
at virtual address c12aaaa8
 printing eip:
c0173823
*pde = 0008e067
*pte = 00000000
Oops: 0002
CPU:    0
EIP:    0010:[<c0173823>]
EFLAGS: 00010286
eax: c12aaaa8   ebx: aaaaaaaa   ecx: 00000004   edx: 00000004
esi: 002aaaa8   edi: c01d886c   ebp: c0097f48   esp: c0097d6c
ds: 0018   es: 0018   ss: 0018
Process swapper (pid: 1, stackpage=c0097000)
Stack: c01f1ee0 c01729ad c01f1ee0 aaaaaaaa 002aaaa8 c0097f48 c01f1ee0
c01f1e4c 
       c01f1ee0 00000001 c02074bc 00000001 00000008 00000021 c01724d2
c01f1ee0 
       00000000 00000000 c0097f48 c0097f48 00000000 c0097f84 c01721c4
c01f1ee0 
Call Trace: [<c01729ad>] [<c01724d2>] [<c01721c4>] [<c011555d>]
[<c011542e>] [<c0115634>] [<c010b69b>] 
       [<c011292b>] [<c0112848>] [<c011274e>] [<c01086e1>] [<c0146a29>]
[<c011555d>] [<c011542e>] [<c0115634>] 
       [<c010b69b>] [<c011292b>] [<c0112848>] [<c011274e>] [<c01086e1>]
[<c0172131>] [<c017348f>] [<c0170f09>] 
       [<c0100018>] [<c0105127>] [<c01055a8>] 

Code: 89 18 5b c3 89 f6 8d bc 27 00 00 00 00 57 56 53 8b 44 24 10 
Kernel panic: Attempted to kill init!
<---------------------------------------------------->

The crash happens in my mapping driver's write32() routine which gets
called from jedec_probe(). What bugs me is that the address that
jedec_probe() wants to write to (0xc12aaaa8) is beyond the address
range of the flash (it is ioremap()ped to 0xc1000000 and is 2MB in
size).

[BTW: if I ioremap() 8 MB instead of 2MB, this fault goes away, but
jedec_probe() still doesn't recognize the chip]

I'm using an MTD snapshot from current CVS and a 2.4.3 kernel.

Thanks for any suggestions

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
