Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCTsF-0000WS-Vr
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 16:38:33 +0000
Subject: Re: [PATCH 05/11 linux-next] ubifs: use magic.h
To: Fabian Frederick <fabf@skynet.be>, Alexander Viro <viro@zeniv.linux.org.uk>
References: <20170521154133.27428-1-fabf@skynet.be>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <7ae468f1-e6b6-ff84-91f4-0f0ba0c6e062@nod.at>
Date: Sun, 21 May 2017 18:38:06 +0200
MIME-Version: 1.0
In-Reply-To: <20170521154133.27428-1-fabf@skynet.be>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fabian,

Am 21.05.2017 um 17:41 schrieb Fabian Frederick:
> Filesystems generally use SUPER_MAGIC values from magic.h
> instead of a local definition.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  fs/ubifs/ubifs.h           | 4 +---
>  include/uapi/linux/magic.h | 1 +
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 298b4d8..abc60d5 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -38,6 +38,7 @@
>  #include <linux/backing-dev.h>
>  #include <linux/security.h>
>  #include <linux/xattr.h>
> +#include <linux/magic.h>
>  #ifdef CONFIG_UBIFS_FS_ENCRYPTION
>  #include <linux/fscrypt_supp.h>
>  #else
> @@ -49,9 +50,6 @@
>  /* Version of this UBIFS implementation */
>  #define UBIFS_VERSION 1
>  
> -/* UBIFS file system VFS magic number */
> -#define UBIFS_SUPER_MAGIC 0x24051905
> -
>  /* Number of UBIFS blocks per VFS page */
>  #define UBIFS_BLOCKS_PER_PAGE (PAGE_SIZE / UBIFS_BLOCK_SIZE)
>  #define UBIFS_BLOCKS_PER_PAGE_SHIFT (PAGE_SHIFT - UBIFS_BLOCK_SHIFT)
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index a83c48f..b651a02 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> @@ -70,6 +70,7 @@
>  #define SYSFS_MAGIC		0x62656572
>  #define TMPFS_MAGIC		0x01021994
>  #define TRACEFS_MAGIC		0x74726163
> +#define UBIFS_SUPER_MAGIC	0x24051905
>  #define UDF_SUPER_MAGIC		0x15013346	/* Since UDF 2.01 is ISO 13346 based... */
>  #define USBDEVICE_SUPER_MAGIC	0x9fa2
>  #define V9FS_MAGIC		0x01021997
> 

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
