Received: from www.tglx.de ([213.239.205.147] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FtrDH-0001UH-IZ
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 15:21:13 -0400
Subject: Re: [RFC] arm : ALIGNMENT_TRAP and MTD
From: Thomas Gleixner <tglx@linutronix.de>
To: "Hyok S. Choi" <hyok.choi@samsung.com>
In-Reply-To: <200606231635.40655.hyok.choi@samsung.com>
References: <200606231635.40655.hyok.choi@samsung.com>
Content-Type: text/plain
Date: Fri, 23 Jun 2006 21:22:50 +0200
Message-Id: <1151090570.25491.294.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-06-23 at 16:35 +0900, Hyok S. Choi wrote:
> Dear MTD folks,
> 
> In ARM arch, we're merging my uClinux/ARM tree into mainline.
> While merging a certain CPU support codes, we found a bit doubt on the
> conditional including of MTD configuration file in arch/arm/Kconfig.
> The CPU core has no H/W based alignment mechanism, thus can not handle unaligned access.
> However as many uClinux archs do, many of the platforms had supported MTD drivers.
> 
> Currently, _only_ ARM arch includes MTD configuration file conditionally as follows:
> 
> if ALIGNMENT_TRAP
> source "drivers/mtd/Kconfig"
> endif

MTD does unaligned accesses. This dependency is there since the early
2.4 kernels.

I really do not want to meddle in the ARM dependency problems. Just my
$0.02: removing this will simply open another round of bug reports
related to this problem. Search the MTD archives, we had plenty of them.

Is there a damn good reason, why the NOMMMU stuff cannot have this
active ? If it enables code which is not feasible on NOMMU there are
ways to solve such problems quite elegant.

It's not a MTD problem, it's an ARM specific requirement.

	tglx
