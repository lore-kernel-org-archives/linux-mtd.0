Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad0wi-0003q0-0f
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 19:36:01 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: kill unused field 'drcmr_cmd'
References: <1457147553-71596-1-git-send-email-computersforpeace@gmail.com>
 <877fhhwcft.fsf@belgarion.home> <20160307183730.GU55664@google.com>
Date: Mon, 07 Mar 2016 20:35:34 +0100
In-Reply-To: <20160307183730.GU55664@google.com> (Brian Norris's message of
 "Mon, 7 Mar 2016 10:37:30 -0800")
Message-ID: <87pov6ulmh.fsf@belgarion.home>
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

Brian Norris <computersforpeace@gmail.com> writes:

> With this removal, we don't need to 'get' the second DMA resource
> either, as it's also unused.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> On Sat, Mar 05, 2016 at 09:34:14AM +0100, Robert Jarzmik wrote:
>> Brian Norris <computersforpeace@gmail.com> writes:
>> > @@ -1812,7 +1811,6 @@ static int alloc_nand_resource(struct platform_device *pdev)
>> >  			ret = -ENXIO;
>> >  			goto fail_disable_clk;
>> >  		}
>> > -		info->drcmr_cmd = r->start;
>> >  	}
>> If you kill this field, why not kill also this block just above ?
>> 		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
>> 		if (r == NULL) {
>> 			dev_err(&pdev->dev,
>> 				"no resource defined for cmd DMA\n");
>> 			ret = -ENXIO;
>> 			goto fail_disable_clk;
>> 		}
>
> Indeed, why not.
>
>  drivers/mtd/nand/pxa3xx_nand.c | 10 ----------
>  1 file changed, 10 deletions(-)
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
