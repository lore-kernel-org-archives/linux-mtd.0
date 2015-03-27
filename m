Received: from mail-ob0-f179.google.com ([209.85.214.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbPn1-00057i-Ta
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 08:38:52 +0000
Received: by obbld8 with SMTP id ld8so14018456obb.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 01:38:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1426772069-12677-1-git-send-email-sr@denx.de>
References: <1426772069-12677-1-git-send-email-sr@denx.de>
Date: Fri, 27 Mar 2015 09:38:30 +0100
Message-ID: <CACRpkdaTXE1WJNgM1MM5SspO5706Csju-qR1uBtRQ=Svg3macQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsmc_nand.c: Use default timings if none are
 provided in the dts
From: Linus Walleij <linus.walleij@linaro.org>
To: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Viresh Kumar <viresh.linux@gmail.com>,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 19, 2015 at 2:34 PM, Stefan Roese <sr@denx.de> wrote:

> Without this patch the timings are all set to 0 if not specified in the dts.
> With this patch the driver falls back to use the defaults that are already
> present in the driver and are known to work okay for some (older) boards.
>
> Tested on a custom SPEAr600 based board.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Viresh Kumar <viresh.linux@gmail.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
