From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com> <45BE1480.1060506@nokia.com>
	<003701c74435$0b1f61f0$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C0B8D4.2000807@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Add support
	for	auto-placementofout-of-banddata
Date: Thu, 1 Feb 2007 12:13:36 +0900
Message-ID: <005701c745ae$fa92f6f0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C0B8D4.2000807@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>  /**
> + * onenand_transfer_auto_oob - [Internal] oob auto-placement transfer
> + * @param mtd		MTD device structure
> + * @param buf		destination address
> + * @param column	oob offset to read from
> + * @param thislen	oob length to read
> + */
> +static int onenand_transfer_auto_oob(struct mtd_info *mtd, 
> uint8_t *buf, int column,
> +				int thislen)
> +{
> +	struct onenand_chip *this = mtd->priv;
> +	struct nand_oobfree *free;
> +	int readcol = column;
> +	int readend = column + thislen;
> +	int lastgap = 0;
> +	uint8_t *oob_buf = this->page_buf + mtd->writesize;
> +
> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		if (readcol >= lastgap)
> +			readcol += free->offset - lastgap;
> +		if (readend >= lastgap)
> +			readend += free->offset - lastgap;
> +		lastgap = free->offset + free->length;
> +	}
> +	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf + readcol,
> +			     readcol, readend - readcol);

How about to read full oobsize? since 32 bytes memcpy is optimized.
Now there are two cases.
case 1: readcol = 2, readend = 36, so read length is 34
case 2: readcol = 2, readend = 64, so read length is 62
Buf if we change to colume = 0, length = 64. we only do 2 loop in memcpy.

this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf, 0, mtd->oobsize);

The contents of buffer are handled correctly (see below)

> +	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +		int free_end = free->offset + free->length;
> +		if (free->offset < readend && free_end > readcol) {
> +			int st = max_t(int,free->offset,readcol);
> +			int ed = min_t(int,free_end,readend);
> +			int n = ed - st;
> +			memcpy(buf, oob_buf + st, n);
> +			buf += n;
> +		}
> +	}
> +	return 0;
> +}
> +
