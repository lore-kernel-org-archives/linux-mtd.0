Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LRvH8-0004LG-8u
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2009 21:15:17 +0000
Date: Tue, 27 Jan 2009 13:14:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 2/5] RBTX4939: Add MTD support
Message-Id: <20090127131454.d2f147df.akpm@linux-foundation.org>
In-Reply-To: <1232460738-4714-2-git-send-email-anemo@mba.ocn.ne.jp>
References: <1232460738-4714-2-git-send-email-anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 Jan 2009 23:12:16 +0900
Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:

> +static void rbtx4939_flash_copy_from(struct map_info *map, void *to,
> +				     unsigned long from, ssize_t len)
> +{
> +	u8 bdipsw = readb(rbtx4939_bdipsw_addr) & 0x0f;
> +	unsigned char shift;
> +	ssize_t curlen;
> +
> +	from += (unsigned long)map->virt;
> +	if (bdipsw & 8) {
> +		/* BOOT Mode: USER ROM1 / USER ROM2 */
> +		shift = bdipsw & 3;
> +		while (len) {
> +			curlen = min((unsigned long)len,
> +				     0x400000 -	(from & (0x400000 - 1)));
> +			memcpy(to,
> +			       (void *)((from & ~0xc00000) |
> +					((((from >> 22) + shift) & 3) << 22)),
> +			       curlen);
> +			len -= curlen;
> +			from += curlen;
> +			to += curlen;
> +		}
> +		return;
> +	}
> +#ifdef __BIG_ENDIAN
> +	if (bdipsw == 0) {
> +		/* BOOT Mode: Monitor ROM */
> +		while (len) {
> +			curlen = min((unsigned long)len,
> +				     0x400000 - (from & (0x400000 - 1)));
> +			memcpy(to, (void *)(from ^ 0x400000), curlen);
> +			len -= curlen;
> +			from += curlen;
> +			to += curlen;
> +		}
> +		return;
> +	}
> +#endif
> +	memcpy(to, (void *)from, len);
> +}

min_t is the preferred way of preventing that warning.

Well.  Actually the preferred way is to get the types right - often the
code simply goofed, and people use casts/min_t to hide that.  But in
this case, yes, casting literal constants to ssize_t would be a bit
silly.

--- a/arch/mips/txx9/rbtx4939/setup.c~mtd-rbtx4939-add-mtd-support-fix
+++ a/arch/mips/txx9/rbtx4939/setup.c
@@ -335,7 +335,7 @@ static void rbtx4939_flash_copy_from(str
 		/* BOOT Mode: USER ROM1 / USER ROM2 */
 		shift = bdipsw & 3;
 		while (len) {
-			curlen = min((unsigned long)len,
+			curlen = min_t(unsigned long, len,
 				     0x400000 -	(from & (0x400000 - 1)));
 			memcpy(to,
 			       (void *)((from & ~0xc00000) |
@@ -351,7 +351,7 @@ static void rbtx4939_flash_copy_from(str
 	if (bdipsw == 0) {
 		/* BOOT Mode: Monitor ROM */
 		while (len) {
-			curlen = min((unsigned long)len,
+			curlen = min_t(unsigned long, len,
 				     0x400000 - (from & (0x400000 - 1)));
 			memcpy(to, (void *)(from ^ 0x400000), curlen);
 			len -= curlen;
_
