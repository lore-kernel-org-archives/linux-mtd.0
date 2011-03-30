Message-ID: <4D92FB78.8050109@freescale.com>
Date: Wed, 30 Mar 2011 17:44:24 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: =?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
Subject: Re: [PATCH V3 2/6] dmaengine: change the flags of request_irq()
References: <1301474413-28821-1-git-send-email-b32955@freescale.com>	<1301474413-28821-3-git-send-email-b32955@freescale.com>	<19858.61894.956256.280158@ipc1.ka-ro>	<20110330091323.GB20019@S2100-06.ap.freescale.net>
	<19858.62649.218523.984252@ipc1.ka-ro>
In-Reply-To: <19858.62649.218523.984252@ipc1.ka-ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux@arm.linux.org.uk, David.Woodhouse@intel.com, dedekind1@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, ffainelli@freebox.fr,
	shijie8@gmail.com, Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:

> Shawn Guo writes:
>> On Wed, Mar 30, 2011 at 11:03:02AM +0200, Lothar Wa=C3=9Fmann wrote:
>>> Hi,
>>>
>>> Huang Shijie writes:
>>>> The GPMI may have many DMA channels, such as the imx23 has
>>>> four DMA channels. All these DMA channels share the same interrupt.
>>>> So change the flags from '0' to IRQF_SHARED, else there will be
>>>> an EBUSY error returns.
>>>>
>>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>>> ---
>>>>   drivers/dma/mxs-dma.c |    2 +-
>>>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
>>>> index 88aad4f..0ee5b52 100644
>>>> --- a/drivers/dma/mxs-dma.c
>>>> +++ b/drivers/dma/mxs-dma.c
>>>> @@ -328,7 +328,7 @@ static int mxs_dma_alloc_chan_resources(struct d=
ma_chan *chan)
>>>>   	memset(mxs_chan->ccw, 0, PAGE_SIZE);
>>>>
>>>>   	ret =3D request_irq(mxs_chan->chan_irq, mxs_dma_int_handler,
>>>> -				0, "mxs-dma", mxs_dma);
>>>> +				IRQF_SHARED, "mxs-dma", mxs_dma);
>>>>   	if (ret)
>>>>   		goto err_irq;
>>>>
>>> IMO this is wrong. The interrupt is requested with all the same
>>> parameters for each DMA channel. So, actually it is not a shared IRQ,
>> The parameter mxs_chan->chan_irq is different for each channel, except
>> gpmi which has 4 channels sharing one irq.
>>
> That's what I mean. The other interrupts won't need the IRQF_SHARED
> flag anyway.
>
Ok. I will add a GPMI-INTERRUPT check in the mxs_dma_alloc_chan_resources=
().
>>> but an IRQ with the same handler registered multiple times, which is
>>> just nonsense.
>>>
>>> Instead of declaring it as shared, it would be more sensible to only
>>> register it for the first channel. Otherwise the handler will be
>>> called multiple times in case of an interrupt with only the first
>>> invocation doing all the work and the subsequent invocations just
>>> returning without doing anything.
>>>
>> --=20
>> Regards,
>> Shawn
>>
> Lothar Wa=C3=9Fmann
Huang Shijie
