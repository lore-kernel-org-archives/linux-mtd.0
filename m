Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ol0A2-00033r-Uu
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 13:55:35 +0000
Received: by ewy9 with SMTP id 9so2663347ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 06:55:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281963920.21549.81.camel@localhost>
References: <AANLkTi=YSS0-Nf4MWOw30YDrCdrkmtzLhv7DXfsoJTjX@mail.gmail.com>
	<53612FE6B944314AAADB181E45A45B64133DDFC156@sc-vexch3.marvell.com>
	<AANLkTimh=dbUV75ZVXuhknt4FiMtximXLY8xoADfbe=q@mail.gmail.com>
	<25B60CDC2F704E4E9D88FFD52780CB4C0597FEB568@SC-VEXCH1.marvell.com>
	<AANLkTimjKThiuNPhVyOh-SL1e7Zwu2R8Sd2DXAFixpY+@mail.gmail.com>
	<1281963920.21549.81.camel@localhost>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 21:55:12 +0800
Message-ID: <AANLkTikCO505BZfqQGsRAdLgMa9hBQZ8YS-hJy-1RGg1@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Haojian Zhuang <hzhuang1@marvell.com>, Lei Wen <leiwen@marvell.com>,
	Axel Lin <axel.lin@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 16, 2010 at 9:05 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Mon, 2010-08-16 at 20:55 +0800, Eric Miao wrote:
>> On Mon, Aug 16, 2010 at 8:49 PM, Haojian Zhuang <hzhuang1@marvell.com> wrote:
>> > http://lists.infradead.org/pipermail/linux-mtd/2010-July/subject.html
>> >
>> > They're re-posted in July. Please search the subjects in that page. They're totally 29 patches.
>> >
>> > By the way, David, what's the result of review on these patches? We already posted for several times.
>> >
>>
>> I've actually reviewed some of the patches and gave my Ack. For those
>> patches, I think they can be merged early.
>>
>> And overall, they look good. Yet 29 patch in a whole is still a bit too
>> much, would be good to see them logically be separated into several
>> patch series.
>
> You had some criticism of patch #1 in the sequence, and some questions.
>

So they need to be addressed. Lei, could you please come up with
an updated patch?

> I didn't look much harder than that, iirc... although looking back now
> it seems that the rest of your responses to the sequence were largely
> positive.
>
> Are you happy with the first patch, and if so shall I go ahead and
> import the whole sequence with your Acked-By:?
>

I'm generally OK, but still think it would be good to have another around
of review before they can be merged.
