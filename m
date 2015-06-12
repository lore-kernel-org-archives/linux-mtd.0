Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3K3l-00065B-A4
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2015 08:11:30 +0000
Message-ID: <1434096662.2271.130.camel@x220>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
From: Paul Bolle <pebolle@tiscali.nl>
To: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
Date: Fri, 12 Jun 2015 10:11:02 +0200
In-Reply-To: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-06-12 at 01:00 +0900, KOBAYASHI Yoshitake wrote:
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5897d8d..050f0e9 100644

> +config MTD_NAND_BENAND
> +	tristate
> +	depends on MTD_NAND_BENAND_ENABLE
> +	default MTD_NAND
> +
> +config MTD_NAND_BENAND_ENABLE
> +	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
> +	default y

Why do you default to 'y'?

> +	help
> +		This enables support for Toshiba BENAND.
> +		Toshiba BENAND is a SLC NAND solution that automatically
> +		generates ECC inside NAND chip.
> +

> --- /dev/null
> +++ b/drivers/mtd/nand/nand_benand.c

> +EXPORT_SYMBOL(nand_benand_status_chk);

I didn't spot any users of nand_benand_status_chk() outside of this
file. Why is this export needed?

Thanks,


Paul Bolle
