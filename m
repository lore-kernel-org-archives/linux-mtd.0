Received: from mail-ob0-f178.google.com ([209.85.214.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSbHz-0003fD-Bi
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 01:38:40 +0000
Received: by obbwr7 with SMTP id wr7so47591645obb.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 18:38:16 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
 [209.85.218.46])
 by smtp.gmail.com with ESMTPSA id a10sm3679428obl.9.2015.08.20.18.38.15
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Aug 2015 18:38:16 -0700 (PDT)
Received: by oiev193 with SMTP id v193so33713654oie.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 18:38:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150820203726.GE74600@google.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <201508201003.38179.marex@denx.de>
 <CAN1oZWwLRYxs=eeWi8jh-jo8+C7WckdW1hfyunmq5_1qb1Jb8w@mail.gmail.com>
 <201508201052.47502.marex@denx.de>
 <CAN1oZWzADdeNyZofXQwKa0F2_Jv4Oda824ew5C3Ug+-V9Lx3hw@mail.gmail.com>
 <20150820203726.GE74600@google.com>
Date: Fri, 21 Aug 2015 09:38:15 +0800
Message-ID: <CAN1oZWz4Yk+Yofjrj8SMs_vgYuf+EzG2Rya9p4XFT2ka5LiK7g@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
From: Viet Nga Dao <vndao@altera.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nga_chi86 <ngachi86@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 4:37 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Thu, Aug 20, 2015 at 05:18:14PM +0800, Viet Nga Dao wrote:
>> You might misunderstand the hardware problem i mention here. This soft
>> IP controller is able to provide the ID for our Altera EPCS/EPCQ flash
>> chips, which are non JEDEC chips. As from EPCQ device data sheet
>> (https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf),
>> the device ID is 8 bit data.
>
> 8 bits of data is vastly insufficient for uniquely identifying a flash.
> This is not extendible and is not really a candidate for inclusion in
> mainline, unless it's somehow guaranteed that these flash can only be
> used with your controller (and I'm not sure how you would do that).
> Otherwise, you need to augment every flash with more out-of-band
> device-tree information.
>
>> The remaining problem here is that this
>> controller is able to support Micron chips but it currently has
>> limitation in providing only 8 bit ID, which is not full JEDEC ID for
>> Micron chips.
>
> You're just proving my point. I will not support "READ ID" detection
> that is based on only 8 bits of ID.
>
>> Hence, we are asking hardware engineer to find out the
>> solution so that the driver does not need to do any dirty hacking.
>
> OK, then I wish your hardware team great speed.
>
>> And
>> so, this table should still be here even hardware fix will take place
>> or not.
>
> I'm not sure how you come to this conclusion.
>

I have this conclusion is because Altera EPCQ/EPCS flashes are non
JEDEC. Thus on the spi_device_id table,
the ID in the INFO struct must be filled up with zeros in order to
matches the current framework.
However, since i still persist to have the device id check in my
driver, as suggested by Rash,
I should implement it locally in my driver. And this table is the look
up table for the device ID of supported flashes.

Or maybe you can give me any other better idea?

> BTW, to reiterate one other question that I feel wasn't adequately
> answered: what does the full ID string look like for these EPCS/EPCQ
> flash chips? Not the ID as seen by your limited controller, but the ID
> that can be reported by the flash chip. Is it really only an 8-bit
> number? Or does it have a longer string that your controller just can't
> read?
>

Yes, As you can refer to page 32 of EPCQ flash datasheet
(https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf),
 "This operation reads the 8-bit device identification of the EPCQ
device from the DATA1 output pin".
Table 29 lists the EPCQ device identifications

Nga
