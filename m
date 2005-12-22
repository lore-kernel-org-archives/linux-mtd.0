Received: from smtp-3.llnl.gov ([128.115.41.83])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpFwF-0004mx-IR
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 21:12:16 -0500
From: Dave Peterson <dsp@llnl.gov>
To: ebiederman@lnxi.com (Eric W. Biederman)
Date: Wed, 21 Dec 2005 18:12:10 -0800
References: <200512201642.05224.dsp@llnl.gov> <200512211037.17680.dsp@llnl.gov>
	<m38xueqnin.fsf@maxwell.lnxi.com>
In-Reply-To: <m38xueqnin.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512211812.10597.dsp@llnl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ichxrom driver question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 21 December 2005 11:05, Eric W. Biederman wrote:
> > What does "cached flash chip" mean?  I have very little familiarity
> > with how these flash chips operate.
>
> The flash chips contents being cached in the cpus cache.
> cat /proc/mtrr and see if covers the 0xfff80000 - 0xffffffff
> range where your flash chip lives.

The MTRR setup looks ok:

    # cat /proc/mtrr
    reg00: base=0x00000000 (   0MB), size=2048MB: write-back, count=1
    #

> > How do I determine whether there is motherboard-specific magic?
>
> Usually I see if I can read out the id on the flash chip.  That
> tests to see if writes make it to the device because you have
> to write a command.

How do I do this?

> > The flash image I tried to install was an exact duplicate of the
> > currently installed flash image, obtained as follows:
> >
> >     # dd if=/dev/mtd0 of=bios_image
> >
> > I was just testing the BIOS flashing mechanism to see if it worked.
>
> Ok.  That sounds sane.  Are you running linuxbios right now or something
> else?

Yes, I'm using linuxbios.
