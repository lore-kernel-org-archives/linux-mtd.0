Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IwiXJ-0005XC-Ms
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 18:18:31 +0000
Date: Mon, 26 Nov 2007 18:45:33 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Massimo CIRILLO <massimo.cirillo@st.com>
Subject: Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
Message-ID: <20071126174533.GA22844@lazybastard.org>
References: <000a01c83051$03c9a510$7205960a@nap.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000a01c83051$03c9a510$7205960a@nap.st.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 26 November 2007 18:23:09 +0100, Massimo CIRILLO wrote:
> 
> We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
> It is related to cache region invalidation in the buffered
> write procedure.
> 
> The original code performs cache invalidation from "adr" to "adr + len" in
> do_write_buffer() while we modify region from "cmd_adr" to "len2" 
> where len2 is equal to initial value of len.

Could use a better name, initial_len or something like that.  And David
would surely appreciate a Signed-off-by: line.  Otherwise appears to
make sense.

> The following is the patch to apply for 2.6.21 kernel.
> 
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26 18:06:37.000000000 +0100
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26 18:06:44.000000000 +0100
> @@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
>  	int ret, wbufsize, word_gap, words;
>  	const struct kvec *vec;
>  	unsigned long vec_seek;
> +	int len2=len;
>  
>  	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
>  	adr += chip->start;
> @@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
>  	chip->state = FL_WRITING;
>  
>  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
> -				   adr, len,
> +				   cmd_adr, len2,
>  				   chip->buffer_write_time);
>  	if (ret) {
>  		map_write(map, CMD(0x70), cmd_adr);
> 

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
