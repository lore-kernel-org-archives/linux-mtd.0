From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <1148000482.13399.42.camel@shinybook.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 12:53:52 +0100
Message-Id: <1148039632.3875.131.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 02:01 +0100, David Woodhouse wrote:
> And would we benefit by using a variable-length encoding of the integers
> in the summary entries? We're far from being CPU-bound when we eat
> these, surely?

Thinking of something vaguely like UTF-8, but more optimal. Each byte
would convey seven bits of information, and the top bit would indicate
whether there's a further byte to be added.

So a number from 0-127 would be stored as-is, while numbers from
128-16383 are stored with seven bits in each of two bytes, with the top
bit of the first set and the top bit of the second clear.

This means we take only two bytes for the common node lengths -- one
byte for nodes up to 508 bytes (obviously we can shift the length >>2
before storing it since it's always a multiple of 4). 

Or should we be more ambitious and actually go for bit-packing instead
of just bytes?

unsigned char *encode_int(unsigned char *p, uint32_t val)
{
	switch (val) {
	case (1<<28) ... 0xffffffff:
		*p++ = 0x80 | ((val >> 28) & 0x7f);
	case (1<<21) ... (1<<28)-1:
		*p++ = 0x80 | ((val >> 21) & 0x7f);
	case (1<<14) ... (1<<21)-1:
		*p++ = 0x80 | ((val >> 14) & 0x7f);
	case (1<<7) ... (1<<14)-1:
		*p++ = 0x80 | ((val >> 7) & 0x7f);
	default:
		*p++ = val & 0x7f;
	}
	return p;
}

unsigned char *decode_int(unsigned char *p, uint32_t *val)
{
	uint32_t ret = 0;
	unsigned char c;

	while ((c = *p++) & 0x80) {
		ret |= c & 0x7f;
		ret <<= 7;
	}
	ret |= c;
	*val = ret;
	return p;
}


-- 
dwmw2
