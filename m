Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cOuSM-0001bV-BX
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 22:54:55 +0000
Subject: Re: [PATCH] ubifs: Fix 'unmet direct dependencies' config warning
 when !BLOCK
To: Augusto Mecking Caringi <augustocaringi@gmail.com>
References: <1483453903-21297-1-git-send-email-augustocaringi@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <695d8005-1433-1bb3-9788-984f5629268f@nod.at>
Date: Wed, 4 Jan 2017 23:54:28 +0100
MIME-Version: 1.0
In-Reply-To: <1483453903-21297-1-git-send-email-augustocaringi@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.01.2017 um 15:31 schrieb Augusto Mecking Caringi:
> When UBIFS_FS_ENCRYPTION is selected and BLOCK is not set, the following
> warning is given:
> 
> warning: (UBIFS_FS_ENCRYPTION) selects FS_ENCRYPTION which has unmet
> direct dependencies (BLOCK)
> 
> Fix it by making BLOCK a dependency of UBIFS_FS_ENCRYPTION.
> 
> Signed-off-by: Augusto Mecking Caringi <augustocaringi@gmail.com>
> ---
>  fs/ubifs/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
> index 0a908ae..e9d7780 100644
> --- a/fs/ubifs/Kconfig
> +++ b/fs/ubifs/Kconfig
> @@ -54,6 +54,7 @@ config UBIFS_ATIME_SUPPORT
>  config UBIFS_FS_ENCRYPTION
>  	bool "UBIFS Encryption"
>  	depends on UBIFS_FS
> +	depends on BLOCK
>  	select FS_ENCRYPTION
>  	default n
>  	help
> 

This is currently being addressed, please see discussions around:
https://lkml.org/lkml/2016/12/19/161
and
https://lkml.org/lkml/2016/12/16/118

Thanks,
//richard
