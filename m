Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIS3U-00059I-3y
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 01:45:44 +0000
Received: by pacan13 with SMTP id an13so5490981pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jul 2015 18:45:22 -0700 (PDT)
Date: Thu, 23 Jul 2015 18:45:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: nand support for Toshiba BENAND (Built-in ECC
 NAND)
Message-ID: <20150724014519.GG8876@google.com>
References: <1437699138-24582-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437699138-24582-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 24, 2015 at 09:52:18AM +0900, KOBAYASHI Yoshitake wrote:
> This patch enables support for Toshiba BENAND. BENAND is a SLC NAND
> solution that automatically generates ECC inside NAND chip.
> 
> I considered to use the patch of on-die ECC, but I believe reading twice
> the same page approach will affect read performance. Additionally, BENAND
> does not support Disable ECC. So, I cannot use same approach.
> 
> BENAND Read Status CMD(70h) is able to report Rewrite Recommend. BENAND
> also has extended ECC Status CMD(7Ah). This command is able to report the
> number of bit error/sector data. When MTD_NAND_BENAND_ENABLE option enabled,
> this driver use the extended ECC status CMD(7Ah) to report real number of
> bitflips. In case of difficult to use CMD(7Ah), this driver use
> "mtd->bitflip_threshold" to assume the number of bitflips.
> 
> Signed-off-by: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
> ---

Where's the changelog? I see that this is version 3...

Brian
