Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNLA4-00027e-UK
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 11:47:57 +0000
Received: by mail-wi0-f178.google.com with SMTP id n15so729501wiw.11
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 04:47:32 -0700 (PDT)
Date: Tue, 11 Mar 2014 11:47:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v6 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Message-ID: <20140311114727.GG21216@lee--X1>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <20140311101342.GA18811@lee--X1>
 <20980858CB6D3A4BAE95CA194937D5E73EAB169A@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB169A@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >> *changes v5 -> v6*
> >> [PATCH 02/04] minor cleanup
> >>
> >> *changes v4 -> v5*
> >> This patch series is split version from earlier series [1].
> >> This series refactors and cleans ELM driver which is used by Hardware
> >> based BCHx ecc-schemes.
> >>  - Undo: introduction of 'struct mtd_info' and 'struct nand_chip'. Instead
> >>          keep ELM driver independent of mtd_info and nand_chip structs and
> >>          pass only required ECC configurations as elm_config() arguments
> >>          elm_config(..., int ecc_steps, int ecc_step_size, int ecc_step_bytes)
> >>  - Undo: re-writing of elm_load_syndrome() ECC register configurations.
> >>
> >> *changes v3 -> v4 [1]*
> >>  - in-corporated feedbacks from Brian Norris <computersforpeace@gmail.com>
> >>  - updated: use 'pr_fmt(fmt)' to suffix DRIVER_NAME
> >>  - removed: local 'eccsteps' in ELM driver, instead using nand_chip->ecc.steps
> >>  - undo: irrelavant white-space changes
> >>
> >> [1] http://lists.infradead.org/pipermail/linux-mtd/2013-November/050242.html
> >>
> >> Pekon Gupta (4):
> >>   mtd: devices: elm: check for hardware engine's design constrains
> >>   mtd: devices: elm: clean elm_load_syndrome
> >>   mtd: devices: elm: configure parallel channels based on ecc_steps
> >>   mtd: devices: elm: update DRIVER_NAME as "omap-elm"
> >>
> >>  drivers/mtd/devices/elm.c         | 44 +++++++++++++++++++++++++++++----------
> >>  drivers/mtd/nand/omap2.c          |  9 +++++---
> >>  include/linux/platform_data/elm.h | 10 ++-------
> >>  3 files changed, 41 insertions(+), 22 deletions(-)
> >
> >I can't seem to be able to apply this set. What kernel release it is
> >based on?
> >
> This is rebased on l2-mtd/master. You can also pull from [1]
> 
> [1] http://git.ti.com/~pekon/connectivity-integration-tree/pekons-connectivity-ti-linux-kernel/commits/l2-mtd/bch16_support

I'm sorry I'm not familiar with the l2-mtd tree. Which upstream
commit are these patches applied on top of?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
