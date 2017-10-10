Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1xR4-0003LX-Et
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 16:31:20 +0000
Subject: Re: [PATCH] mtd: spi-nor: Allow Cadence QSPI support for ARM64
To: Marek Vasut <marek.vasut@gmail.com>, thor.thayer@linux.intel.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1506701269-29652-1-git-send-email-thor.thayer@linux.intel.com>
 <6f21cd6f-4ad7-b611-c22f-45f4ec0232ab@linux.intel.com>
 <d7b8e1f7-b007-c6d1-bcb3-ea096f288a7c@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <f2fbba8e-cd45-45a9-1d6e-eb2a4aae9863@wedev4u.fr>
Date: Tue, 10 Oct 2017 18:30:47 +0200
MIME-Version: 1.0
In-Reply-To: <d7b8e1f7-b007-c6d1-bcb3-ea096f288a7c@gmail.com>
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

Le 06/10/2017 à 17:00, Marek Vasut a écrit :
> On 10/06/2017 04:56 PM, Thor Thayer wrote:
>> gentle ping...
>>
>>
>> On 09/29/2017 11:07 AM, thor.thayer@linux.intel.com wrote:
>>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>>
>>> Allow ARM64 support for the Cadence QSPI interface by
>>> adding ARM64 as a dependency.
>>>
>>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> 

Applied to the spi-nor/next branch of l2-mtd

Thanks!

> I presume it was tested on Stratix 10 ?
> 
>>> ---
>>>   drivers/mtd/spi-nor/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>>> index 69c638dd0484..f26aaa6d1430 100644
>>> --- a/drivers/mtd/spi-nor/Kconfig
>>> +++ b/drivers/mtd/spi-nor/Kconfig
>>> @@ -50,7 +50,7 @@ config SPI_ATMEL_QUADSPI
>>>     config SPI_CADENCE_QUADSPI
>>>       tristate "Cadence Quad SPI controller"
>>> -    depends on OF && (ARM || COMPILE_TEST)
>>> +    depends on OF && (ARM || ARM64 || COMPILE_TEST)
>>>       help
>>>         Enable support for the Cadence Quad SPI Flash controller.
>>>  
>>
> 
> 
