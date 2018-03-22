Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyxqd-0006zd-Vb
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 10:53:36 +0000
Subject: Re: [PATCH v7 2/2] mtd: fsl-quadspi: fix init AHB read in
 fsl_qspi_nor_setup()
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Suresh Gupta <suresh.gupta@nxp.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 Han Xu <han.xu@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>
References: <1521631565-24413-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1521631565-24413-3-git-send-email-yogeshnarayan.gaur@nxp.com>
 <c6dd17bd-672e-89b5-af95-ee6359a6d5e9@exceet.de>
 <DB6PR0402MB2838A58BC4A9C0DEA4DC537599A90@DB6PR0402MB2838.eurprd04.prod.outlook.com>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <c4bbfb56-155c-bb3c-8df9-f5056f2e199f@exceet.de>
Date: Thu, 22 Mar 2018 11:53:18 +0100
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2838A58BC4A9C0DEA4DC537599A90@DB6PR0402MB2838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yogesh,

On 22.03.2018 11:37, Yogesh Narayan Gaur wrote:
> Hi Frieder,
> 
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
>> Frieder Schrempf
>> Sent: Thursday, March 22, 2018 2:49 PM
>> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; linux-
>> mtd@lists.infradead.org
>> Cc: boris.brezillon@free-electrons.com; marek.vasut@gmail.com; Prabhakar
>> Kushwaha <prabhakar.kushwaha@nxp.com>; Suresh Gupta
>> <suresh.gupta@nxp.com>; cyrille.pitchen@wedev4u.fr; Han Xu
>> <han.xu@nxp.com>; computersforpeace@gmail.com; festevam@gmail.com
>> Subject: Re: [PATCH v7 2/2] mtd: fsl-quadspi: fix init AHB read in
>> fsl_qspi_nor_setup()
>>
>> Hi Yogesh,
>>
>> On 21.03.2018 12:26, Yogesh Gaur wrote:
>>> Move AHB read initialize in fsl_qspi_nor_setup().
>>>
>>> In file spi-nor.c, func spi_nor_scan() calls nor->read() thru
>>> spi_nor_read_sfdp() API.
>>>
>>> Presently, fsl_qspi_init_ahb_read() called from fsl_qspi_nor_setup_last().
>>> Func fsl_qspi_probe() calls spi_nor_scan() first and then calls
>>> fsl_qspi_nor_setup_last().
>>>
>>> When nor->read() being called from inside spi_nor_read_sfdp(), QSPI
>>> cntlr AHB mode initialization is not yet done results in data read error.
>>>
>>> Initialize AHB read inside fsl_qspi_nor_setup().
>>>
>>> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
>>> ---
>>> Changes for v7:
>>> - None
>>> Changes for v6:
>>> - None
>>> Changes for v5:
>>> - None
>>> Changes for v4:
>>> - None
>>> Changes for v3:
>>> - None
>>> Changes for v2:
>>> - None
>>>
>>>    drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c
>>> b/drivers/mtd/spi-nor/fsl-quadspi.c
>>> index 64b8bb3..424094a 100644
>>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
>>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
>>> @@ -820,6 +820,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
>>>    	/* enable the interrupt */
>>>    	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
>>>
>>> +	/* Init for AHB read */
>>> +	fsl_qspi_init_ahb_read(q);
>>
>> Maybe I missed something, but it seems if you move
>> fsl_qspi_init_ahb_read() here and fsl_qspi_read() is used before
>> fsl_qspi_nor_setup_last() is called, then the read command is triggered with an
>> uninitialized LUT entry (SEQID_LUT2_AHBREAD).
>>
> For every call to fsl_qspi_read(), I am preparing the LUT before doing actual read so LUT entry for SEQID_LUT2_AHBREAD is never be uninitialized.

Ok, I missed that. Thank you for clarifying this.

Thanks,

Frieder

> 
> Rationale behind moving fsl_qspi_init_ahb_read() from fsl_qspi_nor_setup_last() to fsl_qspi_nor_setup() is to initialize registers which are required for AHB read operation like setting of values in QUADSPI_BUF3CR, QUADSPI_BFGENCR etc registers as fsl_qspi_read() is called, before call to fsl_qspi_nor_setup_last(), through spi_nor_read_sfdp().
> 
> --
> Thanks
> Yogesh Gaur
> 
>> So shouldn't the LUT entry for AHB read be initialized with some default values
>> here, before spi_nor_scan() is called?
>>
>> Thanks,
>>
>> Frieder
>>
>>> +
>>>    	return 0;
>>>    }
>>>
>>> @@ -842,9 +845,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
>>>    	if (ret)
>>>    		return ret;
>>>
>>> -	/* Init for AHB read */
>>> -	fsl_qspi_init_ahb_read(q);
>>> -
>>>    	/* Prepare LUT for AHB read - required for read from devmem interface
>> */
>>>    	fsl_qspi_prep_ahb_read(q);
>>>
>>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> https://smex12-5-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2femea01.safelinks.protection.outlook.com%2f%3furl%3dhttp%253A%252F%252Flists.infr&umid=271ec41c-fb0a-44d3-8e2f-390bb6c9a99b&auth=541e45255b6517100d80c2b1b80b6933b203c492-5a522acd906e3d7618eaba4ad9ad144f477c8f9c
>> adead.org%2Fmailman%2Flistinfo%2Flinux-
>> mtd%2F&data=02%7C01%7Cyogeshnarayan.gaur%40nxp.com%7C427c291bd9c
>> f4eafa3bc08d58fd60d88%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
>> 7C636573071879930483&sdata=qL4febRxR%2BvWiSOcnvxgqLzqOX%2BqTV4PA
>> UorfjgcLUI%3D&reserved=0
