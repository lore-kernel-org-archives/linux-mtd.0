Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQDft-00024c-H4
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2018 15:15:26 +0000
Date: Tue, 5 Jun 2018 17:14:43 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: cfi_cmdset_0002: Avoid point less
 unlocking/locking
Message-ID: <20180605171443.29365913@bbrezillon>
In-Reply-To: <20180605140710.8624-2-joakim.tjernlund@infinera.com>
References: <20180605140710.8624-1-joakim.tjernlund@infinera.com>
 <20180605140710.8624-2-joakim.tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue,  5 Jun 2018 16:07:10 +0200
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> cfi_ppb_unlock() walks all flash chips when unlocking sectors.
> This is a waste when crossing chip boundaris unaffected

				      ^ boundaries.

> by the unlock operation.

AFAICT there are 2 unrelated changes in this commit:
1/ Fix the boundary check which is broken if the unlock operation
   crosses a chip boundary (adr is reset to 0 when that happens).
2/ Avoid unlocking chips that are outside the requested unlock range.

#1 is a fix, #2 is not. You should split that in 2 different commits,
and tag #1 with Fixes and Cc-stable.

> 
> Fixes: 1648eaaa1575e
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index c74c53b886be..ee8b70e54298 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2669,7 +2669,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  		 * sectors shall be unlocked, so lets keep their locking
>  		 * status at "unlocked" (locked=0) for the final re-locking.
>  		 */
> -		if ((adr < ofs) || (adr >= (ofs + len))) {
> +		if ((offset < ofs) || (offset >= (ofs + len))) {
>  			sect[sectors].chip = &cfi->chips[chipnum];
>  			sect[sectors].adr = adr;
>  			sect[sectors].locked = do_ppb_xxlock(
> @@ -2685,6 +2685,8 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  			i++;
>  
>  		if (adr >> cfi->chipshift) {
> +			if (offset >= (ofs + len))
> +				break;
>  			adr = 0;
>  			chipnum++;
>  			if (chipnum >= cfi->numchips)
