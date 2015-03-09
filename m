Received: from mail-we0-f181.google.com ([74.125.82.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUmij-0004nX-FM
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 01:43:02 +0000
Received: by wesx3 with SMTP id x3so17650811wes.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2015 18:42:38 -0700 (PDT)
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com.
 [209.85.212.169])
 by mx.google.com with ESMTPSA id dz6sm13344995wib.0.2015.03.08.18.42.37
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Mar 2015 18:42:38 -0700 (PDT)
Received: by wiwh11 with SMTP id h11so5981225wiw.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Mar 2015 18:42:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150224035956.GE18140@ld-irv-0074>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
 <CAN1oZWwHsm1i2Ap6LJwd5u=1ySokzA6DZCFAqK6wkPCz_P3XMA@mail.gmail.com>
 <CAN1oZWyM8HVuXuCyVankDvZb7JGOg5ysuTz7YwTOGHL89vY9dg@mail.gmail.com>
 <20150224035956.GE18140@ld-irv-0074>
Date: Mon, 9 Mar 2015 09:42:37 +0800
Message-ID: <CAN1oZWzJFF+iQi5t2PsGQJ_3wOO3FBoyCiQ26qVwJQhWGcOT4g@mail.gmail.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
From: Viet Nga Dao <vndao@altera.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Viet Nga Dao <vndao@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,
I understand that you are busy but is it possible if you could spend
some time to help me review my patch? My work progress really depends
on your review.
Thanks,
Viet Nga

On Tue, Feb 24, 2015 at 11:59 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Feb 23, 2015 at 09:30:09AM +0800, Viet Nga Dao wrote:
>> Hi,
>> It has been nearly 2 weeks since i submitted this patch.  Could you
>> please help to review?
>
> Those two weeks were during the merge window, so I wasn't queueing
> anything up. And there are things that have waited longer, anyway. My
> time is unfortunately finite.
>
> I'll get to your patch eventually.
>
>> On Tue, Feb 17, 2015 at 9:33 AM, Viet Nga Dao <vndao@altera.com> wrote:
>> > Hi Brian,
>> > Could you please help me to review through this 2nd version?
>> >
>> > On Wed, Feb 11, 2015 at 12:53 PM, Viet Nga Dao <vndao@altera.com> wrote:
>> >> From: Viet Nga Dao <vndao@altera.com>
>> >>
>> >> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
>> >> EPCS flash chips. This patch adds driver for these devices.
>> >>
>> >> Signed-off-by: VIET NGA DAO <vndao@altera.com>
>> >>
>> >> ---
>> >> v2:
>> >> - Change to spi_nor structure
>> >> - Add lock and unlock functions for spi_nor
>> >> - Simplify the altera_epcq_lock function
>> >> - Replace reg by compatible in device tree
> ...
>
> Brian
