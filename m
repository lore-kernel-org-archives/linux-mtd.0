Received: from mail-pg0-x22e.google.com ([2607:f8b0:400e:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cNwmK-0000Na-U3
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2017 07:11:34 +0000
Received: by mail-pg0-x22e.google.com with SMTP id g1so162033457pgn.0
 for <linux-mtd@lists.infradead.org>; Sun, 01 Jan 2017 23:11:12 -0800 (PST)
Date: Mon, 2 Jan 2017 12:41:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: nand: fsmc: remove stale non-DT probe path
Message-ID: <20170102071109.GD8588@vireshk-i7>
References: <1482060895-26838-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1482060895-26838-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18-12-16, 12:34, Linus Walleij wrote:
> The FSMC driver has an execution path and a header file in
> <linux/mtd/fsmc.h> that serves to support passing in platform
> data through board files, albeit no upstream users of this
> mechanism exist.
> 
> The header file also contains function headers for functions that
> do not exist in the kernel.
> 
> Delete this and move the platform data struct, parsing and
> handling into the driver, assume we are using OF and make the
> driver depend on OF, remove the ifdefs making that optional.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Stefan Roese <sr@denx.de>
> Cc: Vipin Kumar <vipin.kumar@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig     |   1 +
>  drivers/mtd/nand/fsmc_nand.c | 153 ++++++++++++++++++++++++++++++++++++------
>  include/linux/mtd/fsmc.h     | 156 -------------------------------------------
>  3 files changed, 133 insertions(+), 177 deletions(-)
>  delete mode 100644 include/linux/mtd/fsmc.h

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
