Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1duM3G-0007Cy-T0
 for linux-mtd@lists.infradead.org; Tue, 19 Sep 2017 17:11:17 +0000
Subject: Re: [PATCH] mtd: spi-nor: Kill check with no effect
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
References: <20170917141352.23691-1-richard@nod.at>
 <20170918114451.74e6fe68@bbrezillon>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <45983c6e-6fff-0712-b84d-5ae18c830872@wedev4u.fr>
Date: Tue, 19 Sep 2017 19:10:35 +0200
MIME-Version: 1.0
In-Reply-To: <20170918114451.74e6fe68@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Le 18/09/2017 à 11:44, Boris Brezillon a écrit :
> On Sun, 17 Sep 2017 16:13:52 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> header.major is of type u8 and cannot be negative.
> 
> I guess you meant header.minor here.
> 
>>
>> Detected by CoverityScan CID#1417858 ("Integer handling issues")
>>
>> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
>> Parameters (SFDP) tables")
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>> Cyrille,
>>
>> I'm not sure what exactly you wanted to test.
>> Maybe it makes sense casting header.major to s8 before checking against < 0?
>>

Actually I hesitated between checking the exact match with one of the 3
major.minor pairs defined for each version of the JESD216 specification:

JESD216: 1.0
JESD216 rev A: 1.5
JESD216 rev B (the latest one): 1.6

I was wondering whether I should accept 1.1, 1.2, 1.3 and 1.4
(unofficial) pairs too and also later versions, which should be backward
compatible with JESD216 rev B, like rev B is backward compatible with
rev A and so on...

Finally I've chosen to accept everything after 1.0 to give a chance to
next revisions to be supported as much as possible by the current code.
The major number should not change but actually the test upon the minor
value is useless as every unsigned number is greater than or equal to 0 ;)

So once Boris comment taken into account:

Acked-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>

Best regards,

Cyrille

>> Thanks,
>> //richard
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d71765739a93..4b86decdf13e 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2252,8 +2252,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  
>>  	/* Check the SFDP header version. */
>>  	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
>> -	    header.major != SFDP_JESD216_MAJOR ||
>> -	    header.minor < SFDP_JESD216_MINOR)
>> +	    header.major != SFDP_JESD216_MAJOR)
>>  		return -EINVAL;
>>  
>>  	/*
> 
> 
