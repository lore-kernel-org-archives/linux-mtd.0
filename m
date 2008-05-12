Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvX7Q-0007Wb-KC
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 12:27:05 +0000
Date: Mon, 12 May 2008 14:26:51 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bryan Wu <bryan.wu@analog.com>
Subject: Re: [PATCH try#2] [MTD/MAPS] Blackfin BF5xx Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
Message-ID: <20080512122650.GA10014@logfs.org>
References: <1202020355.6671.23.camel@roc-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1202020355.6671.23.camel@roc-laptop>
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

On Sun, 3 February 2008 14:32:35 +0800, Bryan Wu wrote:
> +
> +static void bf5xx_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
> +{
> +	unsigned long i;
> +	map_word test;
> +
> +	if ((unsigned long)to & 0x1) {
> +		for (i = 0; i < len / 2 * 2; i += 2) {
> +			test = bf5xx_read(map, from + i);
> +			put_unaligned(test.x[0], (__le16 *)(to + i));
> +		}
> +	} else {
> +		for (i = 0; i < len / 2 * 2; i += 2) {
> +			test = bf5xx_read(map, from + i);
> +			*((u16*)(to + i)) = test.x[0];
                        ^^^^^^^^^^^^^^^^^

I'm not particularly fond of such constructs, maybe because I have such
a hard time understanding what the code actually does.

How about:
	u16 *foo = to;

	for (i = 0; i < (len & ~1); i++) {
		test = bf5xx_read(map, from + 2 * i);
		foo[i] = test.x[0];
	}

With perhaps a better name than "foo" and the same conversion in the
rest of the function as well?

> +		}
> +	}
> +
> +	if (len & 0x1) {
> +		test = bf5xx_read(map, from + i);
> +		*((u8*)(to + i)) = (u8)test.x[0];
> +	}
> +}

Jörn

-- 
There's nothing better for promoting creativity in a medium than
making an audience feel "Hmm ­ I could do better than that!"
-- Douglas Adams in a slashdot interview
