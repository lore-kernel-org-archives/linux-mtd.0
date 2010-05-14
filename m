Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot
	bank	location
From: David Woodhouse <dwmw2@infradead.org>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 01:19:39 +0100
Message-ID: <1273796379.9999.509.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Wolfram Sang <w.sang@pengutronix.de>, Chris Moore <moore@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-04-24 at 17:58 +0200, Guillaume LECERF wrote:
> From: Uwe Kleine-König <Uwe.Kleine-Koenigi@digi.com>
> 
> After the deleted block bootloc is only used once as follows:
> 
>         if (bootloc == 3 && something_else) {
>                 ...
> 
> So setting bootloc = 2 doesn't change anything.  Taking that the
> warning is wrong and missleading.
> 
> Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> Acked-by: Christopher Moore <moore@free.fr> 

The warning should be preserved for invalid values, or values we don't
support. I don't think it's correct to just remove it.

Looking at the latest datasheet, it looks like values of 0x04 or 0x05
are acceptable, meaning "Uniform, bottom WP protect" and "Uniform, top
WP protect" respectively.

Zero is acceptable only for pre-CFI 1.1 devices, and in that case it
says "refer to device ID code for Top/Bottom boot version of AM29LV160
or AM29LV116". But perhaps we should just probe such devices using the
JEDEC mode anyway.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
