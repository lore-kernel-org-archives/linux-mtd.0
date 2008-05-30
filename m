Received: from mail05.syd.optusnet.com.au ([211.29.132.186])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K1u1O-0006o3-Gn
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 02:07:11 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <1212043611.12909.8.camel@Ubuntu-Desktop>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
	<80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
	<1211924779.6140.9.camel@Ubuntu-Desktop>
	<80b317760805272324p590e96fr2453176c6f035138@mail.gmail.com>
	<1212015172.6110.27.camel@Ubuntu-Desktop>
	<1212015577.6110.31.camel@Ubuntu-Desktop>
	<80b317760805282341n3ffbdc9bw2a919b22568ae618@mail.gmail.com>
	<1212043611.12909.8.camel@Ubuntu-Desktop>
Content-Type: text/plain
Date: Fri, 30 May 2008 12:05:27 +1000
Message-Id: <1212113127.6315.34.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-05-29 at 16:46 +1000, James wrote:
> On Thu, 2008-05-29 at 08:41 +0200, Richard Genoud wrote:
> > ok, so this must be a hardware problem...
> 
> I've emailed Atmel.  I suspect a chip has undergone a dies shrink and
> now there's a timing spec that's violated, unless I've got 2-3 boards
> all with the same hardware problem.

No response yet from Atmel.

> I'll look through the EBI timing setup and the chip requirements when I
> get another moment.

I made the chip timing excessively long/slow and the problems seem to
have disappeared!

At the moment I have.. 
(arch/arm/mach-at91/at91sam9263_devices.c)
        /* set the bus interface characteristics */
        at91_sys_write(AT91_SMC_SETUP(3),
                        AT91_SMC_NWESETUP_(0x1f)
                        | AT91_SMC_NCS_WRSETUP_(0x10)
                        | AT91_SMC_NRDSETUP_(0x1f)
                        | AT91_SMC_NCS_RDSETUP_(0x10));

        at91_sys_write(AT91_SMC_PULSE(3),
                        AT91_SMC_NWEPULSE_(0x1f)
                        | AT91_SMC_NCS_WRPULSE_(0x3f)
                        | AT91_SMC_NRDPULSE_(0x1f)
                        | AT91_SMC_NCS_RDPULSE_(0x3f));

        at91_sys_write(AT91_SMC_CYCLE(3),
                        AT91_SMC_NWECYCLE_(0x7f)
                        | AT91_SMC_NRDCYCLE_(0x7f));

        if (data->bus_width_16)
                mode = AT91_SMC_DBW_16;
        else
                mode = AT91_SMC_DBW_8;

        at91_sys_write(AT91_SMC_MODE(3),
                        mode | AT91_SMC_READMODE
                        | AT91_SMC_WRITEMODE
                        | AT91_SMC_EXNWMODE_DISABLE
                        | AT91_SMC_TDF_(15));

which makes access times pretty slow - but seems reliable.  I'll need to
learn more about the NAND chip timing requirements before refining these
to something more sensible.

Regards,
James.
