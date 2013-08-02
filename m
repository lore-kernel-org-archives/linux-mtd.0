Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5HLJ-00063g-4w
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:32:37 +0000
Message-ID: <1375457848.14869.345.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 06/12] drivers/mtd/nand/gpmi-nand: don't use
 devm_pinctrl_get_select_default() in probe
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Wolfram Sang <wsa@the-dreams.de>
Date: Fri, 02 Aug 2013 18:37:28 +0300
In-Reply-To: <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
References: <1373471889-18107-1-git-send-email-wsa@the-dreams.de>
 <1373471889-18107-6-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-07-10 at 16:57 +0100, Wolfram Sang wrote:
> Since commit ab78029 (drivers/pinctrl: grab default handles from device core),
> we can rely on device core for setting the default pins. Compile tested only.
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org> (personally at LCE13)
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
