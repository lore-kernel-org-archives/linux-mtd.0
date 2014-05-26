Received: from mail-qc0-x22e.google.com ([2607:f8b0:400d:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3Cb-0007UD-V2
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:17:23 +0000
Received: by mail-qc0-f174.google.com with SMTP id c9so4810433qcz.33
 for <linux-mtd@lists.infradead.org>; Mon, 26 May 2014 15:16:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400704153-26626-1-git-send-email-computersforpeace@gmail.com>
References: <1400704153-26626-1-git-send-email-computersforpeace@gmail.com>
Date: Tue, 27 May 2014 00:16:43 +0200
Message-ID: <CADBu1Qt1P9sdBTnDQTw2-EQ_4Mgxrk06EZeeUCUR40rZd2Jtxg@mail.gmail.com>
Subject: Re: [PATCH] mtd: lpddr: fix Kconfig dependency, for I/O accessors
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,
   as discussed this solution is fine for me

Vincenzo

On Wed, May 21, 2014 at 10:29 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Not all architectures implement a writel_relaxed() accessor. Hopefully
> this will change eventually, but for now, this means lpddr2_nvm.c can't
> compile on some architectures.
>
> Let's add an ARM dependency for now, and leave a comment so maybe we can
> change this in the future.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> ---
>  drivers/mtd/lpddr/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/lpddr/Kconfig b/drivers/mtd/lpddr/Kconfig
> index 468f06dea45d..3a19cbee24d7 100644
> --- a/drivers/mtd/lpddr/Kconfig
> +++ b/drivers/mtd/lpddr/Kconfig
> @@ -19,7 +19,8 @@ config MTD_QINFO_PROBE
>             Flash products
>
>  config MTD_LPDDR2_NVM
> -       depends on MTD
> +       # ARM dependency is only for writel_relaxed()
> +       depends on MTD && ARM
>         tristate "Support for LPDDR2-NVM flash chips"
>         help
>           This option enables support of PCM memories with a LPDDR2-NVM
> --
> 1.8.3.2
>
