Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUIJz-0001sn-UB
 for linux-mtd@lists.infradead.org; Wed, 27 Dec 2017 20:29:06 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Added ISSI is25lp080d support
To: Romain Porte <romain.porte@nokia.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexander.sverdlin@nokia.com, pascal.fabreges@nokia.com
References: <20171219134325.3315-1-romain.porte@nokia.com>
 <20171227135809.2407-1-romain.porte@nokia.com>
 <c668b55b-f35e-cdfd-1f90-dc1289a73b40@nokia.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <7eb2e242-1adf-e813-f1cf-f32b672e7459@wedev4u.fr>
Date: Wed, 27 Dec 2017 21:28:39 +0100
MIME-Version: 1.0
In-Reply-To: <c668b55b-f35e-cdfd-1f90-dc1289a73b40@nokia.com>
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

Hi Romain,

Le 27/12/2017 à 15:46, Romain Porte a écrit :
> On 27/12/2017 14:58, Romain Porte wrote:
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 8bafd462f..18e826d36 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1050,6 +1050,8 @@ static const struct flash_info spi_nor_ids[] = {
>>               SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>       { "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>>               SECT_4K | SPI_NOR_DUAL_READ) },
>> +    { "is25lp080d", INFO(0x9d6014, 0, 64 * 1024,  16,
>> +            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>   
> Please note that the new SPI_NOR_DUAL_READ and SPI_NOR_QUAD_READ options have not been tested on our hardware for the moment. The Tested-by flag applies only for the previous configuration without these two new flags. We may be able to test these additional flags in the future, but they were added only from your (Cyrille's) review from previous patch.
> 
> Please let me know if you want to wait for our hardware test results before merging into spi-nor/next, or if you are confident enough to merge it as this.

Based on the manufacturer's datasheet, I'd rather add the
SPI_NOR_{DUAL,QUAD}_READ flags now than later, even if not tested yet.
Otherwise, it would never be tested.
Of course, if you can test on your side, it would be even better!

However, who is the author of this patch? There is no Signed-off-by tag. So
I shouldn't take this patch without this tag.

Besides, the subject line should be something like:
"mtd: spi-nor: Add ISSI is25lp080d support"

>From Documentation/process/submitting-patches.rst:
"""
Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.
"""

Finally, just to let you know if you're not very familiar with posting to
linux mailing lists: some may complain that you didn't configure your mail
client to truncate lines at the 75th or 80th column ;)
It's not a big deal but it's still better to follow the guide lines.

Best regards,

Cyrille

> 
> Romain.
> 
