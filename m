Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaJE2-0006tj-On
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 06:21:39 +0000
Received: by mail-pd0-f172.google.com with SMTP id p10so10413771pdj.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2014 23:21:15 -0700 (PDT)
Date: Tue, 15 Apr 2014 23:21:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: omap: =?utf-8?Q?fix?=
 =?utf-8?Q?_compile_warning_on_=E2=80=98erased=5Fsector=5Fbitflips?=
 =?utf-8?B?4oCZ?=
Message-ID: <20140416062108.GM3131@norris-Latitude-E6410>
References: <20140415003205.0bb2cf44@spike>
 <007d01cf5842$435dcba0$ca1962e0$%han@samsung.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC301C@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAC301C@DBDE04.ent.ti.com>
Cc: 'Christian Engelmayer' <cengelma@gmx.at>,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 15, 2014 at 03:58:56AM +0000, Pekon Gupta wrote:
> >From: Jingoo Han [mailto:jg1.han@samsung.com]
> >>On Tuesday, April 15, 2014 7:32 AM, Christian Engelmayer wrote:
> >>
> >> Commit 2c9f2365 (mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4
> >> in omap_calculate_ecc_bch) introduced minor compile warning
> >> "‘erased_sector_bitflips’ defined but not used [-Wunused-function]" when
> >> compiling without CONFIG_MTD_NAND_OMAP_BCH. Move function
> >> erased_sector_bitflips() into the same ifdef section as the only caller.
> >>
> >> Signed-off-by: Christian Engelmayer <cengelma@gmx.at>
> >
> >Reviewed-by: Jingoo Han <jg1.han@samsung.com>
> >
> Thanks for the patch..
> Acked-by: Pekon Gupta <pekon@ti.com>

Pushed to l2-mtd.git. Thanks!

Brian
