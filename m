Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VP5uI-0004hE-L7
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 07:22:39 +0000
Received: by mail-wi0-f177.google.com with SMTP id cb5so753448wib.4
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2013 00:22:13 -0700 (PDT)
Message-ID: <5243E0A3.1060900@gmail.com>
Date: Thu, 26 Sep 2013 09:22:11 +0200
From: Richard Genoud <richard.genoud@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2] UBI: Call scan_all() with correct offset in error case
References: <1380141125-11063-1-git-send-email-richard@nod.at>
 <1380141125-11063-2-git-send-email-richard@nod.at>
In-Reply-To: <1380141125-11063-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25/09/2013 22:32, Richard Weinberger wrote:
> If we find an invalid fastmap we have to scan from the very beginning.
> Otherwise we leak the first 64 PEBs.
> 
> Reported-by: Richard Genoud <richard.genoud@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/attach.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index c071d41..03b32b0 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -1417,9 +1417,11 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
>  				ai = alloc_ai("ubi_aeb_slab_cache2");
>  				if (!ai)
>  					return -ENOMEM;
> -			}
>  
> -			err = scan_all(ubi, ai, UBI_FM_MAX_START);
> +				err = scan_all(ubi, ai, 0);
> +			} else {
> +				err = scan_all(ubi, ai, UBI_FM_MAX_START);
> +			}
>  		}
>  	}
>  #else
> 

Works great, the assert is not triggered anymore.

Tested-by: Richard Genoud <richard.genoud@gmail.com>
