Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVZCW-0006RV-7V
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 09:14:54 +0000
Date: Wed, 20 Jun 2018 11:14:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 3/4] mtd: cfi_cmdset_0002: Avoid point less
 unlocking/locking
Message-ID: <20180620111430.0dd2ecde@bbrezillon>
In-Reply-To: <20180606101330.11071-3-joakim.tjernlund@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
 <20180606101330.11071-3-joakim.tjernlund@infinera.com>
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

On Wed,  6 Jun 2018 12:13:29 +0200
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> cfi_ppb_unlock() walks all flash chips when unlocking sectors.
> testing lock status on each chip which causes relocking of already
> locked sectors. Test against offset to aviod this aliasing.

					 ^ avoid

As I said before, I think the current code is doing worse than just
relocking already locked sectors. As soon as you cross a chip boundary,
addr is set back to 0, and the (addr < offs || adr >= (ofs + len)) might
be true while it shouldn't be (absolute offset still in the unlock
range), which means you'll lock sectors that the caller expect to be
unlocked.

> 
> Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
> 
>  v2 - Spilt into several patches
> 
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index cb85cccc48c1..b6273ce83de7 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2670,7 +2670,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  		 * sectors shall be unlocked, so lets keep their locking
>  		 * status at "unlocked" (locked=0) for the final re-locking.
>  		 */
> -		if ((adr < ofs) || (adr >= (ofs + len))) {
> +		if ((offset < ofs) || (offset >= (ofs + len))) {
>  			sect[sectors].chip = &cfi->chips[chipnum];
>  			sect[sectors].adr = adr;
>  			sect[sectors].locked = do_ppb_xxlock(
