Received: from [2002:d556:63eb::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BQnYt-0001A4-6t
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 09:26:15 -0400
Received: from 212-133-134-10.sbs.net.tr ([212.133.134.10]
	helo=immortalnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQnYn-0004Ng-BO
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 14:26:09 +0100
Received: from 192.168.0.97 ([81.214.18.126])
	(authenticated user gurhan@hatipoglu.biz) by immortalnetworks.com
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 15:55:14 +0300
From: Gurhan Hatipoglu <gurhan@hatipoglu.biz>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 May 2004 15:38:40 +0300
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QbKrAzLqiuOeei6"
Message-Id: <200405201538.40677.gurhan@hatipoglu.biz>
Subject: Fwd: NAND Flash Problem.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_QbKrAzLqiuOeei6
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello sir/madam;

I forwarded the message attached, by the advice of CVS group. Please inform me 
about the problem forwarded.

Thanks in advance.

Gurhan Hatipoglu
Alpamis Co.

--Boundary-00=_QbKrAzLqiuOeei6
Content-Type: message/rfc822;
  name="forwarded message"
Content-Transfer-Encoding: 7bit
Content-Description: Gurhan Hatipoglu <gurhan@hatipoglu.biz>: NAND Flash
	Problem.

From: Gurhan Hatipoglu <gurhan@hatipoglu.biz>
Organization: Alpamis
Subject: NAND Flash Problem.
Date: Thu, 13 May 2004 11:32:39 +0300
User-Agent: KMail/1.5.4
X-KMail-Link-Message: 640
X-KMail-Link-Type: forward
To: linux-mtd-cvs@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200405131132.39650.gurhan@hatipoglu.biz>
Status: RO
X-Status: S
X-KMail-EncryptionState: 
X-KMail-SignatureState: 



----------  Forwarded Message  ----------

Subject: NAND Flash Problem.
Date: Thursday 13 May 2004 11:10
From: Gurhan Hatipoglu <gurhan@hatipoglu.biz>
To: linux-mtd-cvs-request@lists.infradead.org

Hello sir,

I'm working on Hyundai GMS30C7201 board, using ARM Linux V.2.4.18 Rmk 3.

In addition to NOR Flash, we mounted KM29U64000T 64Kbit NAND flash on the
board to use as a disk, I changed sample VIA board driver according to the
directions given in the Document directory and by referencing addresses in
hardware.h (NAND_BASE 0xf2000000, physical address is 0x08000000).

When I boot the system, VM error is appearing, as below and system is
crashing. When I test ioremap for physical address 0x0800000, system is
giving no nand flash found message.

Please inform me about the casualities, if you have experienced with such
problem.

Thanks,

Gurhan Hatipoglu
gurhan@hatipoglu.biz

Unable to handle kernel paging request at virtual address f2000000
pgd = c0004000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffff
CPU: 0
pc : [<c0093338>]    lr : [<c00932b4>]    Not tainted
sp : c0115f50  ip : c0115f50  fp : c0115f74
r10: c0134260  r9 : 41807202  r8 : c01342e8
r7 : ffffffff  r6 : 000000ff  r5 : ffffffff  r4 : f2000000
r3 : 000000bc  r2 : c00c6c2c  r1 : 00000000  r0 : f0023000
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 217F  Table: 4000401D  DAC: 0000001D
Process swapper (pid: 1, stackpage=c0115000)
Stack: (0xc0115f40 to 0xc0116000)
5f40: c00932b4 c0093338 20000013 ffffffff ffffffff c0134260 c01342e8 c00c6c20
5f60: c00c2b44 4000f2dc c0115f98 c0115f78 c00952b0 c0093294 c0134260 c00e6120
5f80: c01342e8 c00c6c20 c00c2b44 c0115fb8 c0115f9c c000ee60 c0095288 c000fd74
5fa0: c000fd84 c00c7698 c00c768c c0115fd0 c0115fbc c0008988 c000edb4 00000800
5fc0: c00e62ec c0115fe0 c0115fd4 c00089cc c000897c c0115ffc c0115fe4 c00100e8
5fe0: c00089b0 00000800 c00e62ec c00c7698 00000000 c0116000 c0011f34 c00100e8
Backtrace:
Function entered at [<c0093284>] from [<c00952b0>]
Function entered at [<c0095278>] from [<c000ee60>]
 r8 = C00C2B44  r7 = C00C6C20  r6 = C01342E8  r5 = C00E6120
 r4 = C0134260
Function entered at [<c000eda4>] from [<c0008988>]
 r7 = C00C768C  r6 = C00C7698  r5 = C000FD84  r4 = C000FD74
Function entered at [<c000896c>] from [<c00089cc>]
 r5 = C00E62EC  r4 = 00000800
Function entered at [<c00089a0>] from [<c00100e8>]
Function entered at [<c00100d8>] from [<c0011f34>]
 r6 = C00C7698  r5 = C00E62EC  r4 = 00000800
Code: e5c43000 e2455c02 ea000000 e5c43000 (e5c46000)
Kernel panic: Attempted to kill init!

-------------------------------------------------------

--Boundary-00=_QbKrAzLqiuOeei6--
