Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9usc-00081x-Nr
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 06:48:19 +0000
Subject: Re: [PATCH] UBI: Fix s/then/than/ typos
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4BE23A6F.1010406@renesas.com>
References: <4BE23A03.1030001@renesas.com>  <4BE23A6F.1010406@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 09:47:24 +0300
Message-ID: <1273128444.3702.202.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 12:41 +0900, Shinya Kuribayashi wrote:
> Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
> ---
>   drivers/mtd/ubi/Kconfig |    2 +-
>   drivers/mtd/ubi/io.c    |    2 +-
>   drivers/mtd/ubi/kapi.c  |    6 +++---
>   drivers/mtd/ubi/scan.c  |    4 ++--
>   drivers/mtd/ubi/wl.c    |    2 +-
>   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
> index 0a8c7ea..f702a16 100644
> --- a/drivers/mtd/ubi/Kconfig
> +++ b/drivers/mtd/ubi/Kconfig
> @@ -27,7 +27,7 @@ config MTD_UBI_WL_THRESHOLD
>   	  The default value should be OK for SLC NAND flashes, NOR flashes and
>   	  other flashes which have eraseblock life-cycle 100000 or more.
>   	  However, in case of MLC NAND flashes which typically have eraseblock
> -	  life-cycle less then 10000, the threshold should be lessened (e.g.,
> +	  life-cycle less than 10000, the threshold should be lessened (e.g.,
>   	  to 128 or 256, although it does not have to be power of 2).

Thanks for the patches, but they really look corrupted. Could you please
send applicable versions?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
