Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FebTT-000362-Cd
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 13:30:54 -0400
Date: Fri, 12 May 2006 19:30:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Message-ID: <20060512173048.GB17520@wohnheim.fh-wedel.de>
References: <E1Fea2h-0003HL-5g@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1Fea2h-0003HL-5g@pentafluge.infradead.org>
Cc: Jarkko Lavinen <lavinen@pentafluge.infradead.org>
Subject: Re: OneNAND: handle byte access on BufferRAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 May 2006 16:59:03 +0100, Linux-MTD Mailing List wrote:
> 
> @@ -373,6 +373,17 @@ static int onenand_read_bufferram(struct
>  
>  	bufferram += onenand_bufferram_offset(mtd, area);
>  
> +	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
> +		unsigned short word;
> +
> +		/* Align with word(16-bit) size */
> +		count--;
> +
> +		/* Read word and save byte */
> +		word = this->read_word(bufferram + offset + count);
> +		buffer[count] = (word & 0xff);
> +	}
> +
>  	memcpy(buffer, bufferram + offset, count);
>  
>  	return 0;
> @@ -400,6 +411,17 @@ static int onenand_sync_read_bufferram(s
>  
>  	this->mmcontrol(mtd, ONENAND_SYS_CFG1_SYNC_READ);
>  
> +	if (ONENAND_CHECK_BYTE_ACCESS(count)) {
> +		unsigned short word;
> +
> +		/* Align with word(16-bit) size */
> +		count--;
> +
> +		/* Read word and save byte */
> +		word = this->read_word(bufferram + offset + count);
> +		buffer[count] = (word & 0xff);
> +	}
> +
>  	memcpy(buffer, bufferram + offset, count);
>  
>  	this->mmcontrol(mtd, 0);

Duplicated code

> +/* Check byte access in OneNAND */
> +#define ONENAND_CHECK_BYTE_ACCESS(addr)		(addr & 0x1)

ONENAND_IS_BYTE_ACCESS ?

Also, this looks as if you check for unaligned access at the end of
the buffer, but not at the beginning.  Am I missing something or are
you?

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
