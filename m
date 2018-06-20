Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVZMZ-0003QH-9I
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 09:25:17 +0000
Date: Wed, 20 Jun 2018 11:25:03 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] mtd: cfi_cmdset_0002: Avoid walking all chips
 when unlocking.
Message-ID: <20180620112503.26572cf1@bbrezillon>
In-Reply-To: <20180606101330.11071-4-joakim.tjernlund@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
 <20180606101330.11071-4-joakim.tjernlund@infinera.com>
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

On Wed,  6 Jun 2018 12:13:30 +0200
Joakim Tjernlund <joakim.tjernlund@infinera.com> wrote:

> cfi_ppb_unlock() walks all flash chips when unlocking sectors,
> avoid walking chips unaffected by the unlock operation.
> 
> Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
> Cc: stable@vger.kernel.org

That's clearly not a fix, just an optimization. You should drop the
Fixes and Cc-stable tags.

> Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> ---
>  v2 - Spilt into several patches
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index b6273ce83de7..62cd4ee280b3 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2686,6 +2686,8 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
>  			i++;
>  
>  		if (adr >> cfi->chipshift) {
> +			if (offset >= (ofs + len))
> +				break;
>  			adr = 0;
>  			chipnum++;
>  
