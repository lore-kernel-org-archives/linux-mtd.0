Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGGsB-0007RJ-5U
	for linux-mtd@lists.infradead.org; Sun, 11 Feb 2007 10:44:18 -0500
Subject: Re: [PATCH] eXcite nand flash driver
From: Thomas Gleixner <tglx@linutronix.de>
To: Thomas Koeller <thomas.koeller@baslerweb.com>
In-Reply-To: <200702101122.05049.thomas.koeller@baslerweb.com>
References: <200702080157.25432.thomas.koeller@baslerweb.com>
	<1170949737.3646.29.camel@chaos>
	<200702101122.05049.thomas.koeller@baslerweb.com>
Content-Type: text/plain
Date: Sun, 11 Feb 2007 16:44:12 +0100
Message-Id: <1171208652.3661.2.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-02-10 at 11:22 +0100, Thomas Koeller wrote:
> > So I expect an OOPS happens on a regular base.
> I guess it is the 'static void __iomem *tgt = NULL' part that worries
> you? Think about it, that value is never used.

True.

> However, I admit it is somewhat unclean, and therefore I am changing
> it. Updated patch follows.

Yes, it is confusing and looks horrible.

	tglx
