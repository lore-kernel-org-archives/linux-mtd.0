Received: from mailhst2.its.tudelft.nl ([130.161.34.250])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1594FM-0004EW-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2001 13:23:12 +0100
Date: Sun, 10 Jun 2001 14:22:55 +0200
From: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: partitioning bug
Message-ID: <20010610142255.F651@arthur.ubicom.tudelft.nl>
References: <20010608120438.A9491@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010608120438.A9491@crystal.2d3d.co.za>; from abraham@2d3d.co.za on Fri, Jun 08, 2001 at 12:04:38PM +0200
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

On Fri, Jun 08, 2001 at 12:04:38PM +0200, Abraham vd Merwe wrote:
> I've written a chip driver which works great until I use partitioning
> support. If I do that, and I do a MEMGETINFO ioctl() on the first partition
> (/dev/mtd0) I get the following fault as soon as I try and access the
> returned mtd_info_user structure:
> 
> ------------< snip <------< snip <------< snip <------------
> root@tinystor:~# ./debug info
> MTD_open
> MTD_ioctl
> MTD_ioctl
> mtd.type = MTMTD_close
> D_NORFLASInternal error: branch through zero: 0
> CPU: 0
> pc : [<00000004>]    lr : [<020011c8>]
        ^^^^^^^^^^
Not good, you're trying to execute at virtual address 4, which is the
undefined instruction vector (this is an ARM CPU, people). The kernel
can't recover from this in kernel mode.

> sp : bffffdfc  ip : c9673f44  fp : c9673f40
> r10: 400fed50  r9 : 00000006  r8 : c95700e0
> r7 : 00000000  r6 : c06a90e0  r5 : c011bd40  r4 : c807c960
> r3 : ca008378  r2 : 00000001  r1 : c00d4838  r0 : ca008378
> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: C966D17F  Table: C966D17F  DAC: 00000015
> Process debug (pid: 109, stackpage=c9673000)
> Code: bad PC value.
> Stack:
> c9673f20:          020011c8 00000004 a0000013  ca008378 c9673f54 c9673f44
> ca0022e8
> c9673f40: ca005398 c9762600 c9673f78 c9673f58  c0040894 ca0022c0 c9762600
> 00000000
> c9673f60: c07e71e0 00000000 c0012804 c9673f94  c9673f7c c003f748 c0040820
> c07e71e0
> c9673f80: c9762600 20000010 c9673fac c9673f98  c003f7e0 c003f6d4 00000002
> bffffe5c
> c9673fa0: 00000000 c9673fb0 c0012680 c003f760  00000002 c0012ec0 00000003
> 020015fd
> c9673fc0: 00000000 00000000 00000002 bffffe5c  00000003 00000000 00000001
> 400fe248
> c9673fe0: 400fed50 bffffe1c 400aba80 bffffdfc  020011c8 400aba84 20000010
> 00000003
> Backtrace:
> Function entered at [<ca00538c>] from [<ca0022e8>]
> Function entered at [<ca0022b4>] from [<c0040894>]
>  r4 = C9762600
> Function entered at [<c0040814>] from [<c003f748>]
>  r8 = C0012804  r7 = 00000000  r6 = C07E71E0  r5 = 00000000
>  r4 = C9762600
> Function entered at [<c003f6c8>] from [<c003f7e0>]
>  r6 = 20000010  r5 = C9762600  r4 = C07E71E0
> Function entered at [<c003f754>] from [<c0012680>]
>  r5 = BFFFFE5C  r4 = 00000002

[snip]

> So what I don't get is why it crashes. I mean, all that happens during that
> ioctl() is the mtd_info structure gets sent to the user process - no magic
> there that can cause the process to crash.

Try to look up in the System.map file which functions are called, so
you'll get a clue what's going on (the addresses between [] are
important).


Erik

-- 
J.A.K. (Erik) Mouw, Information and Communication Theory Group, Department
of Electrical Engineering, Faculty of Information Technology and Systems,
Delft University of Technology, PO BOX 5031,  2600 GA Delft, The Netherlands
Phone: +31-15-2783635  Fax: +31-15-2781843  Email: J.A.K.Mouw@its.tudelft.nl
WWW: http://www-ict.its.tudelft.nl/~erik/
