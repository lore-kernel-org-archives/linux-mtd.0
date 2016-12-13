Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGqBj-0004X0-15
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 16:44:24 +0000
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 59FDD22BF8
 for <linux-mtd@lists.infradead.org>; Tue, 13 Dec 2016 17:43:59 +0100 (CET)
Subject: Re: [PATCH 1/1] mtd: spi-nor: remove WARN_ONCE() message in
 spi_nor_write()
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <0078578d0f5d2402ac623afabf601d25998f84a9.1481044434.git.cyrille.pitchen@atmel.com>
 <20161208163109.17429627@bbrezillon>
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, richard@nod.at
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <4ffbad4b-f1a5-a998-fe5b-f73b934435e4@wedev4u.fr>
Date: Tue, 13 Dec 2016 17:43:52 +0100
MIME-Version: 1.0
In-Reply-To: <20161208163109.17429627@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 08/12/2016 à 16:31, Boris Brezillon a écrit :
> On Tue, 6 Dec 2016 18:14:24 +0100
> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> 
>> This patch removes the WARN_ONCE() test in spi_nor_write().
>> This macro triggers the display of a warning message almost every time we
>> use a UBI file-system because a write operation is performed at offset 64,
>> which is in the middle of the SPI NOR memory page. This is a valid
>> operation for ubifs.
>>
>> Hence this warning is pretty annoying and useless so we just remove it.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> Suggested-by: Richard Weinberger <richard@nod.at>
>> Suggested-by: Andras Szemzo <szemzo.andras@gmail.com>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
Applied to git://github.com/spi-nor/linux.git

>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index c9bcd05ca5d9..cdeb2c6b1492 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1265,9 +1265,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>>  		ssize_t written;
>>  
>>  		page_offset = (to + i) & (nor->page_size - 1);
>> -		WARN_ONCE(page_offset,
>> -			  "Writing at offset %zu into a NOR page. Writing partial pages may decrease reliability and increase wear of NOR flash.",
>> -			  page_offset);
>>  		/* the size of data remaining on the first page */
>>  		page_remain = min_t(size_t,
>>  				    nor->page_size - page_offset, len - i);
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
