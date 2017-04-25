Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d38Ja-00051k-Ld
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 21:48:08 +0000
Received: from player690.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 425C637A1C
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 23:47:41 +0200 (CEST)
Subject: Re: [PATCH v8 1/4] mtd: spi-nor: introduce SPI 1-2-2 and SPI 1-4-4
 protocols
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <cover.1493149757.git.cyrille.pitchen@wedev4u.fr>
 <cc10c875139d7235fbc4dc8c14ae419e71b9c649.1493149757.git.cyrille.pitchen@wedev4u.fr>
 <681ffcab-6911-0d50-94a8-1dd94e87063b@gmail.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 computersforpeace@gmail.com, dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <87642216-4f3e-8620-0710-12345608963a@wedev4u.fr>
Date: Tue, 25 Apr 2017 23:47:31 +0200
MIME-Version: 1.0
In-Reply-To: <681ffcab-6911-0d50-94a8-1dd94e87063b@gmail.com>
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

Le 25/04/2017 à 22:25, Marek Vasut a écrit :
> On 04/25/2017 10:08 PM, Cyrille Pitchen wrote:
>> From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>>
>> This patch changes the prototype of spi_nor_scan(): its 3rd parameter
>> is replaced by a 'struct spi_nor_hwcaps' pointer, which tells the spi-nor
>> framework about the actual hardware capabilities supported by the SPI
>> controller and its driver.
>>
>> Besides, this patch also introduces a new 'struct spi_nor_flash_parameter'
>> telling the spi-nor framework about the hardware capabilities supported by
>> the SPI flash memory and the associated settings required to use those
>> hardware caps.
>>
>> Then, to improve the readability of spi_nor_scan(), the discovery of the
>> memory settings and the memory initialization are now split into two
>> dedicated functions.
>>
>> 1 - spi_nor_init_params()
>>
>> The spi_nor_init_params() function is responsible for initializing the
>> 'struct spi_nor_flash_parameter'. Currently this structure is filled with
>> legacy values but further patches will allow to override some parameter
>> values dynamically, for instance by reading the JESD216 Serial Flash
>> Discoverable Parameter (SFDP) tables from the SPI memory.
>> The spi_nor_init_params() function only deals with the hardware
>> capabilities of the SPI flash memory: especially it doesn't care about
>> the hardware capabilities supported by the SPI controller.
>>
>> 2 - spi_nor_setup()
>>
>> The second function is called once the 'struct spi_nor_flash_parameter'
>> has been initialized by spi_nor_init_params().
>> With both 'struct spi_nor_flash_parameter' and 'struct spi_nor_hwcaps',
>> the new argument of spi_nor_scan(), spi_nor_setup() computes the best
>> match between hardware caps supported by both the (Q)SPI memory and
>> controller hence selecting the relevant settings for (Fast) Read and Page
>> Program operations.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> 
> [...]
> 

whole series applied to the 'next' branch of the github/spi-nor tree.


Thanks for your reviews!

Best regards,

Cyrille
