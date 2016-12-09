Received: from mail-wj0-x22c.google.com ([2a00:1450:400c:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cFGxH-0003bh-N2
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2016 08:55:00 +0000
Received: by mail-wj0-x22c.google.com with SMTP id v7so8936155wjy.2
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2016 00:54:39 -0800 (PST)
Date: Fri, 9 Dec 2016 08:57:53 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161209085753.GC3625@dell.home>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161205112727.GI1459@lahna.fi.intel.com>
 <2dac1535-de7f-47c3-2747-ba8cac854811@gmail.com>
 <20161205163106.GJ1459@lahna.fi.intel.com>
 <62db8daa-7ebf-1a42-bd70-897c3c636e3c@atmel.com>
 <20161206094525.GA25385@dell.home>
 <20161207085330.GN1459@lahna.fi.intel.com>
 <0695162f-0959-ab2c-4e68-14881e386060@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0695162f-0959-ab2c-4e68-14881e386060@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 07 Dec 2016, Marek Vasut wrote:

> On 12/07/2016 09:53 AM, Mika Westerberg wrote:
> > On Tue, Dec 06, 2016 at 09:45:25AM +0000, Lee Jones wrote:
> >> I'm happy either way.  However if you take them, I will require a
> >> pull-request to an immutable branch containing only these patches.
> >>
> >> If I take them, it won't be until v4.11, since we are half way though
> >> -rc8 already and I would like them to soak in -next for at least a
> >> couple of weeks.
> > 
> > This series already missed v4.8 and v4.9 so I don't think there is a
> > rush to get it for v4.10 either ;-) I'm fine if it goes for v4.11.
> 
> Hmmmmmmmmmmm, that kinda sucks. Lee, are you positive this isn't 4.10
> material ?

The merge-window opens in 2 days.

As I mentioned, I like patches to reside in -next for at least 1 maybe
2 RC cycles before merging.  It's far to easy to accept code, then get
bitten if/when it breaks after being merged by Linus.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
