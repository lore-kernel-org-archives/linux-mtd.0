Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aa6oV-0002TA-QN
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2016 19:15:32 +0000
Received: by mail-qk0-x229.google.com with SMTP id s68so49453696qkh.3
 for <linux-mtd@lists.infradead.org>; Sun, 28 Feb 2016 11:15:11 -0800 (PST)
Date: Sun, 28 Feb 2016 16:15:06 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: fix dmaengine initialization
Message-ID: <20160228191506.GA1907@laptop.cereza>
References: <1455316144-14464-1-git-send-email-robert.jarzmik@free.fr>
 <CAAEAJfCmL4qcKMiTOoM7ixJ_NCTTObUV1v=jE19aWS=18-vqTw@mail.gmail.com>
 <87r3fytosc.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r3fytosc.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27 February 2016 at 07:45, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> On 12 February 2016 at 19:29, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>>> When the driver is initialized in a pure device-tree platform, the
>>> driver's probe fails allocating the dma channel :
>>> [  525.624435] pxa3xx-nand 43100000.nand: no resource defined for data DMA
>>> [  525.632088] pxa3xx-nand 43100000.nand: alloc nand resource failed
>>>
>>> The reason is that the DMA IO resource is not acquired through platform
>>> resources but by OF bindings.
>>>
>>> Fix this by ensuring that DMA IO resources are only queried in the non
>>> device-tree case.
>>>
>>> Fixes: 8f5ba31aa565 ("mtd: nand: pxa3xx-nand: switch to dmaengine")
>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>> ---
>>>  drivers/mtd/nand/pxa3xx_nand.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>>> index a168cbcc1086..afd487d4b67f 100644
>>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>>> @@ -1750,7 +1750,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>>         if (ret < 0)
>>>                 return ret;
>>>
>>> -       if (use_dma) {
>>> +       if (!np && use_dma) {
>>>                 r = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>>>                 if (r == NULL) {
>>>                         dev_err(&pdev->dev,
>>
>> Looking through the kernel tree, this change seems to be correct.
>>
>> However, I'm still wondering how DMA resources are obtained in the
>> device-tree case. Can you explain it to me?
>
> In the pxa case, look at my extract in [1].
> The lines to consider are :
>                         dmas = <&pdma 97 3>;
>                         dma-names = "data";
>
> Now have a look at the function pxad_dma_xlate() in drivers/dma/pxa_dma.c.
> You'll see that the "97" ends up in the chanel drcmr, and the "3" in the
> channel's prio, when the chanel is requested in the nand driver by calling
> dma_request_slave_channel_compat(). In the latter case, pxad_filter_fn() is not
> used, it's the pxad_dma_xlate() which is used instead.
>
> Is this what you were looking for ?
>

I see. That's exactly what I was missing.

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Thanks,
-- 
Ezequiel García, VanguardiaSur
www.vanguardiasur.com.ar
