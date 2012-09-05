Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9KqB-0005Nv-D5
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 19:00:44 +0000
Received: by obbta17 with SMTP id ta17so919032obb.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 12:00:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201209052055.19123.marex@denx.de>
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
 <201209052055.19123.marex@denx.de>
Date: Wed, 5 Sep 2012 16:00:42 -0300
Message-ID: <CAOMZO5DD+6keJ6jkQL-AHzhdobG84=3H_r2HPOFR7apFgKYtYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
From: Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, b32955@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Wed, Sep 5, 2012 at 3:55 PM, Marek Vasut <marex@denx.de> wrote:
> Dear Fabio Estevam,
>
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Using module_platform_driver() makes the code smaller and cleaner.
>
> You did not document the dev_info() etc. addition, dunno if it's important or
> not.

It is not an addition. I just moved  "pr_info("driver registered.\n")"
 from gpmi_nand_init, (which is removed by this patch) to the probe
function.

Regards,

Fabio Estevam
