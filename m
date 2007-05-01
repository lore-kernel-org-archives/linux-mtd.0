Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1His43-0004X4-TB
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 09:06:44 -0400
Subject: Re: [patch] generic nand driver for SoCs
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <acd2a5930705010603s36f4b0c8l43b04bd970ac8b1c@mail.gmail.com>
References: <46373163.7060603@gmail.com>
	<1178024451.5791.299.camel@localhost.localdomain>
	<acd2a5930705010603s36f4b0c8l43b04bd970ac8b1c@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 01 May 2007 15:09:00 +0200
Message-Id: <1178024940.5791.300.camel@localhost.localdomain>
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

On Tue, 2007-05-01 at 17:03 +0400, Vitaly Wool wrote:
> On 5/1/07, Thomas Gleixner <tglx@linutronix.de> wrote:
> > > +#ifdef CONFIG_MTD_PARTITIONS
> > > +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> > > +#endif
> > > +
> > Hmm, this should be provided by the platform as well.
> 
> Really? I don't think platform code can call parse_mtd_partitions --
> nothing is set up at that moment yet. Please correct me if I'm missing
> something.

I meant the list of probe types which should be done.

	tglx
