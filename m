Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1en0GN-0007VO-3K
 for linux-mtd@lists.infradead.org; Sat, 17 Feb 2018 11:02:40 +0000
From: Vignesh R <vigneshr@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Kamal Dasu <kdasu.kdev@gmail.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
 <20180212133158.3032442f@bbrezillon>
 <67e61203-a2e9-853c-6cda-7226499611c2@ti.com>
 <20180212170809.3f0b5e20@bbrezillon>
 <0944fefa-6ef8-a93a-dad6-660044b8ec8e@ti.com>
 <20180214200952.6a8578dc@bbrezillon>
Message-ID: <55878296-f1c9-434b-3c7e-e2f03f5824a9@ti.com>
Date: Sat, 17 Feb 2018 16:31:48 +0530
MIME-Version: 1.0
In-Reply-To: <20180214200952.6a8578dc@bbrezillon>
Content-Type: text/plain; charset="utf-8"
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


[...]
>>>>>>     
>>>>>>> +static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
>>>>>>> +   .exec_op = ti_qspi_exec_mem_op,      
>>>>>>
>>>>>>         .supports_op = ti_qspi_supports_mem_op,
>>>>>>
>>>>>> Its required as per spi_controller_check_ops() in Patch 1/6    
>>>>>     
>>>>> ->supports_op() is optional, and if it's missing, the core will do the    
>>>>> regular QuadSPI/DualSPI/SingleSPI check (see spi_mem_supports_op()
>>>>> implementation).     
>>>>
>>>> You might have overlooked spi_controller_check_ops() from Patch 1/6:
>>>> +static int spi_controller_check_ops(struct spi_controller *ctlr)
>>>> +{
>>>> +	/*
>>>> +	 * The controller can implement only the high-level SPI-memory
>>>> +	 * operations if it does not support regular SPI transfers.
>>>> +	 */
>>>> +	if (ctlr->mem_ops) {
>>>> +		if (!ctlr->mem_ops->supports_op ||
>>>> +		    !ctlr->mem_ops->exec_op)
>>>> +			return -EINVAL;
>>>> +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
>>>> +		   !ctlr->transfer_one_message) {
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>
>>>> So if ->supports_op() is not populated by SPI controller driver, then
>>>> driver probe fails with -EINVAL. This is what I observed on my TI
>>>> hardware when testing this patch series.  
>>>
>>> Correct. Then I should fix spi_controller_check_ops() to allow empty
>>> ctlr->mem_ops->supports_op.
>>>   
>>>>  
>>>>> This being said, if you think a custom ->supports_op()
>>>>> implementation is needed for this controller I can add one.
>>>>>     
>>>>
>>>> spi_mem_supports_op() should suffice for now if above issue is fixed.  
>>>
>>> Cool. IIUC, you tested the series on a TI SoC. Does it work as
>>> expected? Do you see any perf regressions?
>>>   

No other functional failures or performance issues so far wrt TI QSPI.
Things look good :)


-- 
Regards
Vignesh
