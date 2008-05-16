Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwuON-0001Jw-Bo
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 07:30:15 +0000
Message-ID: <482D36FD.6050506@nokia.com>
Date: Fri, 16 May 2008 10:25:49 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [RFC][PATCH][MTD][OneNAND] Fix OneNAND byte access
References: <20080516044508.GA28048@party>
In-Reply-To: <20080516044508.GA28048@party>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> Some upper layer try to read unaligned offset access
> So it adjusts the buffer, offset, and count variables
> 
> / # mount -t ubifs ubi0 /mnt
> UBIFS: recovery needed
> onenand_read_bufferram[528] 0 11	<- Unaligned count
> onenand_read_bufferram[514] 91 12	<- Unaligned offset
> onenand_read_bufferram[528] 92 11
> onenand_read_bufferram[528] 74 17
> onenand_read_bufferram[514] 103 17	<- Unaligned offset
> onenand_read_bufferram[514] 11 17
> onenand_read_bufferram[514] 137 17
> onenand_read_bufferram[528] 120 17
> onenand_read_bufferram[528] 40 17
> onenand_read_bufferram[514] 57 17
> onenand_read_bufferram[528] 632 61
> onenand_read_bufferram[528] 360 61
> onenand_read_bufferram[528] 80 61
> 
> It's only optimization at driver level
> 
> I think it's the best that it handles at UBIFS itself
> e.g., Now it passed down from name handling
> If the size of name is odd how about pad it even?

It would be a lot of work to change UBIFS.

It is really a driver problem.  For example OMAP2
does not have the problem, so it should be fixed at
the driver level.

> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index 5d7965f..49194b6 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -509,9 +509,23 @@ static int onenand_read_bufferram(struct mtd_info *mtd, int area,
>  
>  	bufferram += onenand_bufferram_offset(mtd, area);
>  
> +	if (ONENAND_CHECK_BYTE_ACCESS(offset)) {
> +		unsigned short word;
> +		printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
> +
> +		/* Align with word(16-bit) size */
> +		/* Read word and save byte */
> +		word = this->read_word(bufferram + offset - 1);
> +		buffer[0] = (word & 0xff00) >> 8;
> +		buffer++;
> +		offset++;
> +		count--;
> +	}
> +
>  	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
>  		unsigned short word;
>  
> +		printk("%s[%d] %d %zd\n", __func__, __LINE__, offset, count);
>  		/* Align with word(16-bit) size */
>  		count--;
>  
> 

I presume you will remove the printks.
