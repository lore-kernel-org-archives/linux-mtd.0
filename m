Subject: Re: [PATCH 1/6] mtd: cfi_cmdset_0002: remove unused
	MANUFACTURER_{AMD, ATMEL} definitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
References: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Mar 2010 16:03:49 +0300
Message-ID: <1269954229.6648.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-02-20 at 13:57 +0100, Guillaume LECERF wrote:
> Remove MANUFACTURER_AMD and MANUFACTURER_ATMEL definition from
> cfi_cmdset_0002.c as it is unused and a deplicate of CFI_MFR_{AMD,ATMEL}
> already in include/linux/mtd/cfi.h.
> 
> Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index f3600e8..1fe27ea 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -43,8 +43,6 @@
>  
>  #define MAX_WORD_RETRIES 3
>  
> -#define MANUFACTURER_AMD	0x0001
> -#define MANUFACTURER_ATMEL	0x001F
>  #define MANUFACTURER_MACRONIX	0x00C2
>  #define MANUFACTURER_SST	0x00BF
>  #define SST49LF004B	        0x0060

This patch series does not apply to the current mtd-2.6.git. Please,
take a look and re-send it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
