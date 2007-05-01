Received: from wx-out-0506.google.com ([66.249.82.224])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1His1N-0004Kf-Re
	for linux-mtd@lists.infradead.org; Tue, 01 May 2007 09:04:04 -0400
Received: by wx-out-0506.google.com with SMTP id t8so1877480wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 May 2007 06:03:56 -0700 (PDT)
Message-ID: <acd2a5930705010603s36f4b0c8l43b04bd970ac8b1c@mail.gmail.com>
Date: Tue, 1 May 2007 17:03:56 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: tglx@linutronix.de
Subject: Re: [patch] generic nand driver for SoCs
In-Reply-To: <1178024451.5791.299.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46373163.7060603@gmail.com>
	<1178024451.5791.299.camel@localhost.localdomain>
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
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
> > +#endif
> > +
> Hmm, this should be provided by the platform as well.

Really? I don't think platform code can call parse_mtd_partitions --
nothing is set up at that moment yet. Please correct me if I'm missing
something.

Other than that, I do agree with your comments, thanks,

Vitaly
