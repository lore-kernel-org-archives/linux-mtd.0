Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cECH4-0006Rm-06
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 09:43:00 +0000
Received: by mail-wm0-x22a.google.com with SMTP id f82so118782429wmf.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2016 01:42:36 -0800 (PST)
Date: Tue, 6 Dec 2016 09:45:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161206094525.GA25385@dell.home>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161205112727.GI1459@lahna.fi.intel.com>
 <2dac1535-de7f-47c3-2747-ba8cac854811@gmail.com>
 <20161205163106.GJ1459@lahna.fi.intel.com>
 <62db8daa-7ebf-1a42-bd70-897c3c636e3c@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62db8daa-7ebf-1a42-bd70-897c3c636e3c@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 05 Dec 2016, Cyrille Pitchen wrote:

> Le 05/12/2016 à 17:31, Mika Westerberg a écrit :
> > On Mon, Dec 05, 2016 at 02:33:12PM +0100, Marek Vasut wrote:
> >> On 12/05/2016 12:27 PM, Mika Westerberg wrote:
> >>> On Mon, Nov 28, 2016 at 03:06:23PM +0300, Mika Westerberg wrote:
> >>>> This is 6th iteration of the series. You can find the previous versions
> >>>> archived on:
> >>>>
> >>>>   v5: https://lwn.net/Articles/706363/
> >>>>   v4: https://lwn.net/Articles/703773/
> >>>>   v3: https://lwn.net/Articles/697231/
> >>>>   v2: http://lists.infradead.org/pipermail/linux-mtd/2016-June/068277.html
> >>>>   v1: https://lkml.org/lkml/2016/6/14/269
> >>>>
> >>>> This patch series adds support for the Intel SPI serial flash controller
> >>>> found on many recent Intel CPUs including Baytrail and Braswell. This
> >>>> driver makes it possible to access the BIOS and other platform data which
> >>>> is stored on the SPI serial flash. It is also possible to upgrade the BIOS
> >>>> using this driver if it has not been protected by special hardware bits.
> >>>>
> >>>> The patch [1/3] includes documentation how to upgrade BIOS on MinnowBoard
> >>>> MAX.
> >>>>
> >>>> Since poking the SPI serial flash can brick the machine, this driver can
> >>>> only be enabled when CONFIG_EXPERT=y and even then it will remain read-only
> >>>> unless instructed othwerwise by module parameter.
> >>>
> >>> Hi Lee,
> >>>
> >>> I think we have enough acks from the MTD maintainers. I wonder if you
> >>> could merge this series via your MFD tree?
> >>>
> >> Ideally you'd merge 1/3 via MTD and 2,3/3 via MFD, but I'm not sure if
> >> that is possible and if that is a sensible thing to do.
> > 
> > There is a dependency between patches 1 and 2 (and 3) so they should be
> > merged together to avoid build errors. I'm fine if they go via either
> > tree as long as someone picks them up ;-)
> > 
> 
> we can take it in the mtd: spi-nor: tree if you want, just let us know
> whether it's fine with you or if you prefer to take it from mtd.

I'm happy either way.  However if you take them, I will require a
pull-request to an immutable branch containing only these patches.

If I take them, it won't be until v4.11, since we are half way though
-rc8 already and I would like them to soak in -next for at least a
couple of weeks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
