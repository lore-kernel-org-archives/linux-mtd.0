Received: from mail-ig0-f177.google.com ([209.85.213.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XinOt-0006ox-02
 for linux-mtd@lists.infradead.org; Mon, 27 Oct 2014 16:44:11 +0000
Received: by mail-ig0-f177.google.com with SMTP id h18so3523251igc.4
 for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2014 09:43:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413042040-28222-4-git-send-email-vinod.koul@intel.com>
References: <1413041973-28146-1-git-send-email-vinod.koul@intel.com>
 <1413042040-28222-4-git-send-email-vinod.koul@intel.com>
Date: Mon, 27 Oct 2014 17:43:46 +0100
Message-ID: <CACRpkdZegs9zpM0Mxjiqkoc0kJPyz5mvN31x=Pge=TEWqk+U2g@mail.gmail.com>
Subject: Re: [PATCH 04/12] mtd: fsmc_nand: use dmaengine_terminate_all() API
From: Linus Walleij <linus.walleij@linaro.org>
To: Vinod Koul <vinod.koul@intel.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Brown <broonie@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jg1.han@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 dmaengine@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 11, 2014 at 5:40 PM, Vinod Koul <vinod.koul@intel.com> wrote:

> The drivers should use dmaengine_terminate_all() API instead of
> accessing the device_control which will be deprecated soon
>
> Signed-off-by: Vinod Koul <vinod.koul@intel.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
