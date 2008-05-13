Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvpXx-0003qW-H4
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 08:07:41 +0000
Date: Tue, 13 May 2008 10:07:27 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bryan Wu <cooloney@kernel.org>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin Async Flash Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
Message-ID: <20080513080727.GA15795@logfs.org>
References: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, will.newton@gmail.com,
	Mike Frysinger <vapier.adi@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 May 2008 12:38:45 +0800, Bryan Wu wrote:
>
> +#define pr_devinit(fmt, args...) ({ static const __devinitdata char __fmt[] = fmt; printk(__fmt, ## args); })

Is this still needed?

> +static void bfin_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
> +{
> +	size_t i;
> +	map_word test;
> +
> +	if ((unsigned long)to & 0x1) {
> +		for (i = 0; i < len; i += 2) {
> +			u16 *dst = (u16 *)(to + i);
> +			test = bfin_read(map, from + i);
> +			put_unaligned(test.x[0], dst);
> +		}
> +	} else {
> +		for (i = 0; i < len; i += 2) {
> +			u16 *dst = (u16 *)(to + i);
> +			test = bfin_read(map, from + i);
> +			*dst = test.x[0];
> +		}
> +	}
> +
> +	if (len & 0x1) {
> +		u8 *last_to_byte = (u8 *)(to + i);
> +		test = bfin_read(map, from + i);
> +		*last_to_byte = (u8)test.x[0];
> +	}
> +}

The pointer casts are superfluous.  Linus prefers variable declarations
up front (sorry for my bad example).  The "+ i" in the last conditional
is a bit dangerous as any changes to the loop can break it.  Linux code
has lots of churn and not everyone is careful enough to spot such
subtleties.
And I believe you can improve performance by killing the put_unaligned
in the loop.  So if we put it all together the end result should be
something like this:

static void bfin_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	size_t i;
	map_word test;
	u8 *byte;
	u16 *dst;

	if ((unsigned long)to & 0x1) {
		byte = to;
		test = bfin_read(map, from);
		*byte = test.x[0] >> 8;
		to++;
		from++;
		len--;
	}

	for (i = 0; i < len; i += 2) {
		dst = to + i;
		test = bfin_read(map, from + i);
		*dst = test.x[0];
	}

	if ((len & 0x1) {
		byte = to + len - 1;
		test = bfin_read(map, from + len - 1);
		*byte = test.x[0] & 0xff;
	}
}

What do you think?

> +static void bfin_write(struct map_info *map, map_word d1, unsigned long ofs)
> +{
> +	struct async_state *state = (struct async_state *)map->map_priv_1;
> +	u16 d;
> +
> +	d = (u16)d1.x[0];

You didn't need the cast above.  Why here?

Otherwise looks good to me.

Jörn

-- 
Debugging is twice as hard as writing the code in the first place.
Therefore, if you write the code as cleverly as possible, you are,
by definition, not smart enough to debug it.
-- Brian W. Kernighan
