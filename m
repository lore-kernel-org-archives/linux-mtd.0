Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjOtT-0004gu-8b
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 05:00:27 +0000
Received: by iyn15 with SMTP id 15so5332443iyn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2011 22:00:19 -0700 (PDT)
Subject: Re: [PATCH] mtd/fsmc_nand: fix build error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Jul 2011 08:01:41 +0300
In-Reply-To: <1310986539-458-1-git-send-email-linus.walleij@linaro.org>
References: <1310986539-458-1-git-send-email-linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311138106.20738.137.camel@sauron>
Mime-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-07-18 at 12:55 +0200, Linus Walleij wrote:
> Recent -next does not build due to malformed code, so just fix it.
> 
> Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Dmitry can you check that I fixed this the right way?
> ---
>  drivers/mtd/nand/fsmc_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, instead of taking this patch I've folded it in Dmitry's
"mtd: fsmc_nand.c: use mtd_device_parse_register" patch to make sure
upstream is bisectable. I've added your name to the commit message.

Pushed to l2-mtd-2.6.git, thanks!

FYI: my l2-mtd-2.6.git is visible in -next now, so you should see
the fix there soon.

-- 
Best Regards,
Artem Bityutskiy
