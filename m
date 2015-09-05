Received: from smtp12.smtpout.orange.fr ([80.12.242.134]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYJkT-0008Ue-8N
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2015 20:07:42 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: switch to dmaengine
References: <1440441674-12103-1-git-send-email-robert.jarzmik@free.fr>
 <20150905183445.GB6978@laptop.cereza>
Date: Sat, 05 Sep 2015 22:02:27 +0200
In-Reply-To: <20150905183445.GB6978@laptop.cereza> (Ezequiel Garcia's message
 of "Sat, 5 Sep 2015 15:34:45 -0300")
Message-ID: <87twr8ws6k.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Robert,
>
> Just a couple of minor comments.
>> +	dma_unmap_sg(info->dma_chan->device->dev,
>> +		     &info->sg, 1, info->dma_dir);
>
> Unneeded line breaking.
Indeed, for v2.

>> +		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
>> +		if (r == NULL) {
>> +			dev_err(&pdev->dev,
>> +				"no resource defined for cmd DMA\n");
>> +			ret = -ENXIO;
>> +			goto fail_disable_clk;
>> +		}
>> +		info->drcmr_cmd = r->start;
>
> AFAICS, you only do data DMA, so this command resource can go away.
> If you want to keep it for now and remove it as a follow up patch,
> that's fine.
Yeah, keep it in this patch, and change in a future patch (ie. keep current
behavior).

> Other than this minor stuff:
>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Thanks, I'll add that in v2.

> Tested on Armada 370 to make sure it doesn't cause any regressions.
Good. Was it on top of linux-next or linux master ?

Cheers.

-- 
Robert
