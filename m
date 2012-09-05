Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Ldh-0001pb-As
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 19:51:54 +0000
Received: by obbta17 with SMTP id ta17so1020372obb.36
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2012 12:51:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201209052123.54695.marex@denx.de>
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
 <201209052055.19123.marex@denx.de>
 <CAOMZO5DD+6keJ6jkQL-AHzhdobG84=3H_r2HPOFR7apFgKYtYA@mail.gmail.com>
 <201209052123.54695.marex@denx.de>
Date: Wed, 5 Sep 2012 16:51:52 -0300
Message-ID: <CAOMZO5CjKaMOoc009rDC_RO58J5KO2uWmnQaAuH3SdFAtD0Esw@mail.gmail.com>
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

On Wed, Sep 5, 2012 at 4:23 PM, Marek Vasut <marex@denx.de> wrote:

> Ah, just noticed. I'd say drop it completely then, there's now value in this
> print (or make it pr_debug() ). Besides, the init call was called only once if

I think we can keep this info. It does not hurt and this is how the
current driver does.

> compiled in / every time if built as a module. The probe call is done per GPMI
> nand driver instance.

,which is fine too.

Regards,

Fabio Estevam
