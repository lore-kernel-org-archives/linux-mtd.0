Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdbcU-0007Np-N9
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 11:50:13 +0000
Received: by mail-lf0-x244.google.com with SMTP id v186so10861648lfa.2
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2017 03:49:45 -0800 (PST)
Subject: Re: [PATCH V2 3/3] mtd: spi-nor: add support for ESMT_f25l32qa and
 ESMT_f25l64qa
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 John Crispin <john@phrozen.org>, Marek Vasut <marek.vasut@gmail.com>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
 <1482304990-23942-4-git-send-email-john@phrozen.org>
 <215ff33d-29a2-e340-9ce9-8c623a11575c@atmel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Larry D. Pinney" <ldpinney@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <799e62b0-cbc3-3bae-32ac-9e595992e5d4@gmail.com>
Date: Tue, 14 Feb 2017 12:49:42 +0100
MIME-Version: 1.0
In-Reply-To: <215ff33d-29a2-e340-9ce9-8c623a11575c@atmel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/30/2017 02:04 PM, Cyrille Pitchen wrote:
> Le 21/12/2016 à 08:23, John Crispin a écrit :
>> From: "Larry D. Pinney" <ldpinney@gmail.com>
>>
>> Add Support for the ESMT_F25L32QA and ESMT_F25L64QA
>> These are 4MB and 8MB SPI NOR Chips from Elite Semiconductor Memory
>> Technology
>>
>> Acked-by: Marek Vasut <marex@denx.de>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Larry D. Pinney <ldpinney@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index bfff159..2b150b5 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -821,6 +821,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>
>>  	/* ESMT */
>>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64, SECT_4K) },
>> +	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K) },
>>
>
> This patch cannot be applied to the github spi-nor tree.
> Another recent patch [1] has updated the "f25l32pa" entry to add the
> SPI_NOR_HAS_LOCK flag. I guess the "f25l{32|64}qa" entries need this flag
> as well.
>
> [1] on the spi-nor tree, commit 252c36bb9c7b ("mtd: spi-nor: Add
> lock/unlock support for f25l32pa")

Hi Larry, I just realized you never resent rebased patch.

Can you do this, please?
