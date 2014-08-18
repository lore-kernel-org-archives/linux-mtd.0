Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJJqB-0007YK-Jj
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 10:07:03 +0000
Received: by mail-ig0-f178.google.com with SMTP id uq10so7268689igb.5
 for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2014 03:06:41 -0700 (PDT)
Date: Mon, 18 Aug 2014 11:06:36 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/8] mtd: nand: Support for new DT NAND driver
Message-ID: <20140818100636.GB4266@lee--X1>
References: <1407921127-8590-1-git-send-email-lee.jones@linaro.org>
 <20140814224013.GE18411@ld-irv-0074>
 <20140818083953.GA4266@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140818083953.GA4266@lee--X1>
Cc: pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Particularly, take a hard look at rewriting
> > include/linux/mtd/stm_nand_bbt.h.
> 
> I don't think there is any need - although this change is required:
> 
> -#if defined(MTD_NAND_STM_BBT)
> +#if defined(MTD_NAND_STM_BCH_BBT)

Sorry, I mean this:

-#if defined(MTD_NAND_STM_BBT)
+#if defined(CONFIG_MTD_NAND_STM_BCH_BBT)

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
