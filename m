Received: from wx-out-0506.google.com ([66.249.82.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1His8q-0004kN-9r
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 09:11:41 -0400
Received: by wx-out-0506.google.com with SMTP id t8so1879089wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 May 2007 06:11:39 -0700 (PDT)
Message-ID: <acd2a5930705010611s1ae1bc74x83d9863660a672b5@mail.gmail.com>
Date: Tue, 1 May 2007 17:11:39 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: tglx@linutronix.de
Subject: Re: [patch] generic nand driver for SoCs
In-Reply-To: <1178024940.5791.300.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46373163.7060603@gmail.com>
	<1178024451.5791.299.camel@localhost.localdomain>
	<acd2a5930705010603s36f4b0c8l43b04bd970ac8b1c@mail.gmail.com>
	<1178024940.5791.300.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/1/07, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, 2007-05-01 at 17:03 +0400, Vitaly Wool wrote:
> > On 5/1/07, Thomas Gleixner <tglx@linutronix.de> wrote:
> > > > +#ifdef CONFIG_MTD_PARTITIONS
> > > > +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> > > > +#endif
> > > > +
> > > Hmm, this should be provided by the platform as well.
> >
> > Really? I don't think platform code can call parse_mtd_partitions --
> > nothing is set up at that moment yet. Please correct me if I'm missing
> > something.
>
> I meant the list of probe types which should be done.

Ah, okay, will do.

Vitaly
