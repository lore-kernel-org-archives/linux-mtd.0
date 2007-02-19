Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJ8Gx-00044N-D3
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 08:09:43 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l1JD6dcX024102
	for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2007 15:06:45 +0200
Message-ID: <45D9A141.3040300@nokia.com>
Date: Mon, 19 Feb 2007 15:08:17 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] Make ecclayout static const
References: <007101c74e4c$bdb8bbb0$c7a3580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <007101c74e4c$bdb8bbb0$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> @@ -827,13 +829,15 @@ static int onenand_transfer_auto_oob(struct mtd_info
> *mtd, uint8_t *buf, int col
>  				int thislen)
>  {
>  	struct onenand_chip *this = mtd->priv;
>  	struct nand_oobfree *free;
>  	int readcol = column;
>  	int readend = column + thislen;
>  	int lastgap = 0;
>  	uint8_t *oob_buf = this->page_buf + mtd->writesize;
> +	int i;
>  
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
>  		if (readcol >= lastgap)
>  			readcol += free->offset - lastgap;
>  		if (readend >= lastgap)
> @@ -841,7 +845,8 @@ static int onenand_transfer_auto_oob(struct mtd_info
> *mtd, uint8_t *buf, int col
>  		lastgap = free->offset + free->length;
>  	}
>  	this->read_bufferram(mtd, ONENAND_SPARERAM, oob_buf, 0, mtd-
>> oobsize);
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
>  		int free_end = free->offset + free->length;
>  		if (free->offset < readend && free_end > readcol) {
>  			int st = max_t(int,free->offset,readcol);
> @@ -1270,19 +1277,22 @@ static int onenand_fill_auto_oob(struct mtd_info
> *mtd, u_char *oob_buf,
>  				  const u_char *buf, int column, int
> thislen)
>  {
>  	struct onenand_chip *this = mtd->priv;
>  	struct nand_oobfree *free;
>  	int writecol = column;
>  	int writeend = column + thislen;
>  	int lastgap = 0;
> +	int i;
>  
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
>  		if (writecol >= lastgap)
>  			writecol += free->offset - lastgap;
>  		if (writeend >= lastgap)
>  			writeend += free->offset - lastgap;
>  		lastgap = free->offset + free->length;
>  	}
> -	for (free = this->ecclayout->oobfree; free->length; ++free) {
> +	free = this->ecclayout->oobfree;
> +	for (i = 0; i < ARRAY_SIZE(this->ecclayout->oobfree); i++, free++) {
>  		int free_end = free->offset + free->length;
>  		if (free->offset < writeend && free_end > writecol) {
>  			int st = max_t(int,free->offset,writecol);

Isn't this still needed?

Note you could use MTD_MAX_OOBFREE_ENTRIES instead of ARRAY_SIZE
