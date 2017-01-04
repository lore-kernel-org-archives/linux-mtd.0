Subject: Re: [PATCH v2 2/2] mtd: nand: Update dependency of IFC for LS1021A
To: Alison Wang <alison.wang@nxp.com>, Alison Wang <b18965@freescale.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "cyrille.pitchen@atmel.com" <cyrille.pitchen@atmel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
References: <1483411266-45875-1-git-send-email-b18965@freescale.com>
 <1483411266-45875-2-git-send-email-b18965@freescale.com>
 <4e04eb5e-fb53-f71e-ee49-0872a6c11e97@gmail.com>
 <DB6PR0401MB2584606EC932BF1FAED788E1F4610@DB6PR0401MB2584.eurprd04.prod.outlook.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <ffb2c20d-3aeb-6f5a-1880-3bed0c964821@gmail.com>
Date: Wed, 4 Jan 2017 02:50:59 +0100
MIME-Version: 1.0
In-Reply-To: <DB6PR0401MB2584606EC932BF1FAED788E1F4610@DB6PR0401MB2584.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/04/2017 02:46 AM, Alison Wang wrote:
>> On 01/03/2017 03:41 AM, Alison Wang wrote:
>>> As NAND support for Freescale/NXP IFC controller is available on
>>> LS1021A, the dependency for LS1021A is added.
>>
>> Does LS stand for LayerScape ? Yes it does. So why does ARCH_LAYERSCAPE
>> not cover LS1021 ?
> [Alison Wang] LS1021A is an earlier product and is not compatible with later Layerscape architecture. So ARCH_LAYERSCAPE can't cover LS1021A.

Ah ok, I see. That information would be useful in the commit message ;-)

>>
>>> Signed-off-by: Alison Wang <alison.wang@nxp.com>
>>> ---
>>> Changes in v2:
>>> - None
>>>
>>>  drivers/mtd/nand/Kconfig | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index
>>> 353a9dd..85e3860 100644
>>> --- a/drivers/mtd/nand/Kconfig
>>> +++ b/drivers/mtd/nand/Kconfig
>>> @@ -441,7 +441,7 @@ config MTD_NAND_FSL_ELBC
>>>
>>>  config MTD_NAND_FSL_IFC
>>>  	tristate "NAND support for Freescale IFC controller"
>>> -	depends on FSL_SOC || ARCH_LAYERSCAPE
>>> +	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
>>>  	select FSL_IFC
>>>  	select MEMORY
>>>  	help
>>>
> 
> Best Regards,
> Alison Wang
> 


-- 
Best regards,
Marek Vasut
