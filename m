MIME-Version: 1.0
In-Reply-To: <4F7D3DB8.6080009@freescale.com>
References: <CAOdLEarFOdmDBS0iDmafLeBU=NNWxWjejTvJ-eEkQjRO12+VYg@mail.gmail.com>
 <20120404070157.GB24930@pengutronix.de>
 <CAOdLEaqXyvHzTRSq2=RquZLqEO6kMEp11rjKJ+UtSqtF4nr-EA@mail.gmail.com>
 <20120404183314.GF17187@pengutronix.de>
 <CAOdLEaoboQowyx3T9ONjv-Y3q1JfFRb4ahS8CNrzeJi3N8Dczg@mail.gmail.com>
 <CAOMZO5AsbFDXHs3JRLC5=1MjZ7QrxciqV25xpZQL1Yvk3boQmw@mail.gmail.com>
 <CAOdLEaoEDr7fnswwV-Gs8tZF9Zj-RFnRa9Z=eqRFd0==OgV10Q@mail.gmail.com>
 <CAOMZO5AoFnM=cCR-kS4A1k2xY_bRd9+gN1p9bFxdyPS2-UdbkQ@mail.gmail.com>
 <4F7D3DB8.6080009@freescale.com>
Date: Thu, 5 Apr 2012 05:03:54 -0700
Message-ID: <CAOdLEaoy8ARS=awimR6fN8EcX+FrqxaSr3VUG3rP3zrNLOf+Gw@mail.gmail.com>
Subject: Re: Using GPMI-NAND driver on iMX28 using 3.4-rc1?
From: Sam Gandhi <samgandhi9@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
 Vinod Koul <vinod.koul@intel.com>, Wolfram Sang <w.sang@pengutronix.de>,
 linux-mtd@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/4/4 Huang Shijie <b32955@freescale.com>:
> Hi All:
>> On Wed, Apr 4, 2012 at 7:07 PM, Sam Gandhi<samgandhi9@gmail.com> =A0wrot=
e:
>>
>>> I reverted that commit and I still see following =A0error!
>> Huang,
>>
>> Are you able to use gpmi on mx28 running 3.4-rc1?
>>
> I also meet the same problem today.
>
>
>>> flash_erase /dev/mtd1 0 0
>>> Erasing 1------------[ cut here ]------------
>>> kernel BUG at /home/sam/linux/drivers/dma/dmaengine.h:53!
> the mxs-dma has added some patches about the cookie.
> The bug is in the dmaengine.h.
>
> So let more people know this bug.
>
> BR
> Huang Shijie
>
>
FWIW, Just a data point.

I coverted BUG_ON in dmaengine.h to printk as shown below. With this
change I was able to format nand, create UBI partition. I have been
running UBI torture test called integck on my board that does lot of
I/O, mounting/unmounting of filesystem for close to 8 hour now without
crash. But I do see those printks. I haven't followed logic of
tx->cookie well enough to figure out what the appropriate change
should be. Note this is with commit
00292bbf769620dea923dbd906afd88955f7ea19 reverted in my tree.

Cookie 0  completed 102118268 DMA_MIN 1
Cookie 0  completed 102120401 DMA_MIN 1
Cookie 0  completed 102237726 DMA_MIN 1

git diff drivers/dma/dmaengine.h
diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 17f983a..3d10a70 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -50,7 +50,11 @@ static inline dma_cookie_t dma_cookie_assign(struct
dma_async_tx_descriptor *tx)
  */
 static inline void dma_cookie_complete(struct dma_async_tx_descriptor *tx)
 {
-       BUG_ON(tx->cookie < DMA_MIN_COOKIE);
+       if ( tx->cookie < DMA_MIN_COOKIE)
+               printk(KERN_ERR "Cookie %d,  completed %d DMA_MIN %d
",tx->cookie,
+               tx->chan->completed_cookie,
+               DMA_MIN_COOKIE);
+       /* BUG_ON(tx->cookie < DMA_MIN_COOKIE); */
        tx->chan->completed_cookie =3D tx->cookie;
        tx->cookie =3D 0;
 }

Regards,
-Sam
