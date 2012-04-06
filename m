Message-ID: <4F7EC6AF.6000603@freescale.com>
Date: Fri, 6 Apr 2012 18:34:23 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
References: <20120404070157.GB24930@pengutronix.de>
 <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
 <20120404183314.GF17187@pengutronix.de>
 <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
 <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
 <1333628861.31825.22.camel@vkoul-udesk3>
 <20120406022305.GJ7264@S2101-09.ap.freescale.net>
In-Reply-To: <20120406022305.GJ7264@S2101-09.ap.freescale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Vinod Koul <vinod.koul@linux.intel.com>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Fabio Estevam <festevam@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Sam Gandhi <samgandhi9@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B404=E6=9C=8806=E6=97=A5 10:23, Shawn Guo =E5=86=99=E9=
=81=93:
> On Thu, Apr 05, 2012 at 05:57:41PM +0530, Vinod Koul wrote:
>> On Thu, 2012-04-05 at 05:03 -0700, Sam Gandhi wrote:
>>> 2012/4/4 Huang Shijie<b32955@freescale.com>:
> ...
>>>>>> flash_erase /dev/mtd1 0 0
>>>>>> Erasing 1------------[ cut here ]------------
>>>>>> kernel BUG at /home/sam/linux/drivers/dma/dmaengine.h:53!
>>>> the mxs-dma has added some patches about the cookie.
>>>> The bug is in the dmaengine.h.
>>>>
>>>> So let more people know this bug.
>>>>
> I'm still trying to understand why I did run into the BUG_ON when I
> test it with mxs mmc and sound drivers.
>
> ...
>
>> This means you are trying to mark a cookie complete when it is already
>> marked so!, hence dmaengine screams.
>> The bug is is mxs-dma.
>> Let me know if below fixes it (assuming you are not using cyclic API,
>> that would need fixup as well)
>>
>> diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
>> index c81ef7e..5ddd84e 100644
>> --- a/drivers/dma/mxs-dma.c
>> +++ b/drivers/dma/mxs-dma.c
>> @@ -399,6 +399,10 @@ static struct dma_async_tx_descriptor
>> *mxs_dma_prep_slave_sg(
>>   		ccw->bits&=3D ~CCW_DEC_SEM;
>>   	} else {
>>   		idx =3D 0;
>> +		/* assign cookie here,
>> +		 * hopefully for above case we dont need it
>> +		 */
>> +		dma_cookie_assign(&mxs_chan->desc);
> Isn't it done in mxs_dma_tx_submit() already? The gpmi driver somehow

It's maybe too late to assign the DMA cookie after mxs_dma_enable_chan()=20
in mxs_dma_tx_submit().
The interrupt may arise before the dma_cookie_assign() finishes.

Why mmc/audio do not have this bug? their interrupt arise too slow.

I tested the following code :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 5978113..0f5b09a 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -202,10 +202,12 @@ static struct mxs_dma_chan *to_mxs_dma_chan(struct=20
dma_cha
static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
{
struct mxs_dma_chan *mxs_chan =3D to_mxs_dma_chan(tx->chan);
+ dma_cookie_t c;

+ c =3D dma_cookie_assign(tx);
mxs_dma_enable_chan(mxs_chan);

- return dma_cookie_assign(tx);
+ return c;
}

static void mxs_dma_tasklet(unsigned long data)


> misses the call to dmaengine_submit() for some case?
>
> Regards,
> Shawn
>
>>   	}
>>
>>   	if (direction =3D=3D DMA_TRANS_NONE) {
>>
>> --=20
