Received: from mail-qt0-f179.google.com ([209.85.216.179])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxDyB-0004BT-RK
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 14:05:20 +0000
Received: by mail-qt0-f179.google.com with SMTP id s49so54930751qta.0
 for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2016 07:04:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPybu_2j6vn9y-rOAvs2vp18RvSEe8qkg_r3RdRGNgna7-J31A@mail.gmail.com>
References: <20160920154551.3494-1-ricardo.ribalda@gmail.com>
 <20160921090704.2cfebfc8@bbrezillon>
 <CAPybu_0S0juNTNO1eQUbxyvcDR8o8W-69+oK5G_i42Z8CHS+FA@mail.gmail.com>
 <20160921101420.7ea87f2d@bbrezillon>
 <CAPybu_1f924DvgT1hSPyEMyD7tTN8Cng=mkq5ydDBBbZqpUtuw@mail.gmail.com>
 <20160921102137.6ff58bc7@bbrezillon>
 <CAPybu_2j6vn9y-rOAvs2vp18RvSEe8qkg_r3RdRGNgna7-J31A@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 20 Oct 2016 16:03:37 +0200
Message-ID: <CAPybu_0U-j6yrO0oOY99UqdVoSqqzN=2c3MbRV8wosWqhm_8EA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>,
 Jagan Teki <jteki@openedev.com>, Vignesh R <vigneshr@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Furquan Shaikh <furquan@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping?

On Wed, Sep 21, 2016 at 10:26 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi
>
>>>
>>> Unsinged long is more than enough for s3an. I think v7 is ok.
>>
>> Then, why did you change the spi_nor_s3an_addr_convert() prototype?
>>
>
> Because it is used in spi_nor_read and spi_nor_write, which use loff_t.
>
> I think it is more clean to have only one comment explaining the max
> size of the s3an, instead of having them scattered around. But if
> think that it is better to have unsinged int as prototype I have no
> problem in changing it.
>
> Regards!
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
