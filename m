Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOBVW-0002WZ-Rp
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 18:04:48 +0000
Received: by mail-ob0-f177.google.com with SMTP id wd20so6770685obb.36
 for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2012 11:04:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350371967-8914-1-git-send-email-josh.wu@atmel.com>
References: <1350371967-8914-1-git-send-email-josh.wu@atmel.com>
Date: Tue, 16 Oct 2012 11:04:44 -0700
Message-ID: <CACiLriQ1fTbGs7eCK5eeF=99um=EQaj-vefjEnvDS0bwWa5m=w@mail.gmail.com>
Subject: Re: [PATCH] avr32: fix build error in atstk1006_defconfig
From: =?ISO-8859-1?Q?H=E5vard_Skinnemoen?= <havard@skinnemoen.net>
To: Josh Wu <josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org, hskinnemoen@gmail.com,
 linux-mtd@lists.infradead.org, fengguang.wu@intel.com, egtvedt@samfundet.no
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 16, 2012 at 12:19 AM, Josh Wu <josh.wu@atmel.com> wrote:
> fixed the following compile error when use avr32 atstk1006_defconfig:
>   drivers/mtd/nand/atmel_nand.c: In function 'pmecc_err_location':
>   drivers/mtd/nand/atmel_nand.c:639: error: implicit declaration of function 'writel_relaxed'
>
> which was introduced by commit 1c7b874d33b463 ("mtd: at91: atmel_nand: add Programmable Multibit ECC controller support").
> The PMECC for nand flash code uses writel_relaxed(). But in avr32, there is no macro "writel_relaxed" defined. This patch add writex_relaxed macro definitions.
>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Acked-by: Havard Skinnemoen <havard@skinnemoen.net>

I think it's OK to just forward to write[bwl] -- the relaxed variants
merely provide fewer ordering guarantees than the non-relaxed
variants. The worst that could happen is a small performance hit (and
on AVR32, even that is highly unlikely).

Havard
