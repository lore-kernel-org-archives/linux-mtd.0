Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a5r2A-0007rA-5x
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2015 08:20:34 +0000
Received: by vkha189 with SMTP id a189so97778372vkh.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 00:20:12 -0800 (PST)
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1449463619.9118.31.camel@mhfsdcap03>
References: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
 <CAGS+omCuB3VGcPk3fezakdVDnFB3GAmMD+wZ_6nGdv+uHoB40g@mail.gmail.com>
 <1449462852.9118.25.camel@mhfsdcap03> <1449463619.9118.31.camel@mhfsdcap03>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Mon, 7 Dec 2015 16:19:53 +0800
Message-ID: <CAGS+omBycHuNaMy5vuEf0ZSRTniCS50qEdAY0=L1_1Wno4EBTQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Add nor flash node
To: bayi cheng <bayi.cheng@mediatek.com>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bayi,

On Mon, Dec 7, 2015 at 12:46 PM, bayi cheng <bayi.cheng@mediatek.com> wrote:
> On Mon, 2015-12-07 at 12:34 +0800, bayi cheng wrote:
>> On Mon, 2015-12-07 at 12:09 +0800, Daniel Kurtz wrote:
>> > Bayi,
>> >
>> > On Mon, Dec 7, 2015 at 11:53 AM, Bayi Cheng <bayi.cheng@mediatek.com> wrote:
>> > > Add Mediatek nor flash node
>> > >
>> > > Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
>> > > Acked-by: Brian Norris <computersforpeace@gmail.com>
>> > > ---
>> > > Previous version of this patch is
>> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386005.html
>> > > Drop flash node from mt8173.dtsi accroding review comment
>> >
>> > Is there a flash on mt8173-evb that can be accessed by the nor_flash ?
>> > If so, can you include flash@0 node in the mt8173-evb.dts.
>> >
>> > -Dan
>> >
>> Hi Daniel, Thanks for your comments! you are right, there is a flash on
>> mt8173-evb which can be accessed by the nor_flash, and I will include
>> flash@0 node in mt8173-evb.dts (kernel v3.18) too.
>>
>> Bayi
>
> Hi Dan, I have reworked a EVB board for spi nor verify, we replaced the
> spi nand flash with spi nor flash on EVB board,
> and our shipping EVB board haven't support spi nor flash, So I will not
> include flash@0 node in the mt8173-evb.dts. I am sorry to made you
> confused!

Thanks for confirming.

Reviewed-by: Daniel Kurtz <djkurtz@chromium. org>
