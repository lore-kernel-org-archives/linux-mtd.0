Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byyCl-00019E-7x
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 09:39:38 +0000
Subject: Re: [PATCH v3 8/9] mtd: spi-nor: add support to Macronix mx66l1g45g
To: Marek Vasut <marex@denx.de>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
 <4db277dccf52acd48e592d9f285724aab70704d1.1477325128.git.cyrille.pitchen@atmel.com>
 <b043147d-cc39-9238-c6e7-432af67f684e@denx.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
Message-ID: <1d74bddb-fcf7-cb0c-5c0f-a86a54c9a033@atmel.com>
Date: Tue, 25 Oct 2016 11:39:11 +0200
MIME-Version: 1.0
In-Reply-To: <b043147d-cc39-9238-c6e7-432af67f684e@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

Le 25/10/2016 à 00:16, Marek Vasut a écrit :
> On 10/24/2016 06:34 PM, Cyrille Pitchen wrote:
>> This patch adds an entry in the spi_nor_ids[] table to add support
>> to the Macronix mx66l1g45g.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index db4874d4af79..eb21d3d4e4e6 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -937,6 +937,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>> +	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>  
>>  	/* Micron */
>>
> This should be submitted separately as it could be applied right away.
> 

I totally agree with you. Indeed I have only provided patch 8 and 9 because
I refer to these memories in the cover letter and to "prove" that I did really
test every memory of the list. If everyone trust me about the test I do, I
will remove patch 8 and 9 in the next version.

By the way, I need to add a remark about the Spansion S25FL127S. The sample I
have is compliant with neither the JESD216B specification nor the Cypress
datasheet. More precisely, the Cypress datasheet claims that the S25FL127S
is compliant with the JESD216B (minor 6) so its Basic Flash Parameter Table
(BFPT) should contain 16 DWORDS.
However my sample claims to be JESD216B compliant (I read minor 6) and that
the BFPT has 16 DWORDS but the 7 last DWORDS of this table are all 0xFFFFFFFF.
Only the first 9 DWORDS are properly filled, the DWORDS described in JESD216
(minor 0).
Also my sample pretend to provide the optional 4-byte address instruction set
(4BAIS) table but the data I read are once again all 0xFFFFFFFF.

It's surprising that this 128Mbit memory supports the 4-byte address
instruction set but the 4-byte Fast Read actually seems to be supported.

Consequently, Fast Read operations work but Sector Erase cannot due to the
0xFF op code read from the 4BAIS table. I think I just have a broken sample so
if anyone can test with another sample and confirm that the SFDP series also
work with Spansion S25FL127S it would be nice! :)

Best regards,

Cyrille
