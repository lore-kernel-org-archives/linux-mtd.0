Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkzEX-00038c-Mz
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 12:56:10 +0000
Received: by eye22 with SMTP id 22so1065835eye.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 05:56:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <25B60CDC2F704E4E9D88FFD52780CB4C0597FEB568@SC-VEXCH1.marvell.com>
References: <AANLkTi=YSS0-Nf4MWOw30YDrCdrkmtzLhv7DXfsoJTjX@mail.gmail.com>
	<53612FE6B944314AAADB181E45A45B64133DDFC156@sc-vexch3.marvell.com>
	<AANLkTimh=dbUV75ZVXuhknt4FiMtximXLY8xoADfbe=q@mail.gmail.com>
	<25B60CDC2F704E4E9D88FFD52780CB4C0597FEB568@SC-VEXCH1.marvell.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 20:55:48 +0800
Message-ID: <AANLkTimjKThiuNPhVyOh-SL1e7Zwu2R8Sd2DXAFixpY+@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for
	samsung2GbX8
To: Haojian Zhuang <hzhuang1@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Axel Lin <axel.lin@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 16, 2010 at 8:49 PM, Haojian Zhuang <hzhuang1@marvell.com> wrot=
e:
> http://lists.infradead.org/pipermail/linux-mtd/2010-July/subject.html
>
> They're re-posted in July. Please search the subjects in that page. They'=
re totally 29 patches.
>
> By the way, David, what's the result of review on these patches? We alrea=
dy posted for several times.
>

I've actually reviewed some of the patches and gave my Ack. For those
patches, I think they can be merged early.

And overall, they look good. Yet 29 patch in a whole is still a bit too
much, would be good to see them logically be separated into several
patch series.

> Thanks
> Haojian
>
> -----Original Message-----
> From: Eric Miao [mailto:eric.y.miao@gmail.com]
> Sent: 2010=E5=B9=B48=E6=9C=8816=E6=97=A5 8:44 PM
> To: Lei Wen
> Cc: Axel Lin; linux-kernel; David Woodhouse; linux-mtd@lists.infradead.or=
g; Haojian Zhuang
> Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix timing and cmdset for samsu=
ng2GbX8
>
> On Mon, Aug 16, 2010 at 8:34 PM, Lei Wen <leiwen@marvell.com> wrote:
>> Hi Axel,
>>
>> I suggest not merge your patch into mainline code. Since I have a large =
series of patch which reconstruct the nand flash definition, this fix would=
 no longer be needed.
>>
>
> Lei, would you please point the URL of the patch series (possibly by
> searching linux-mtd archive or some other mailing list archive) so that
> Axel can have a reference and be involved?
>
> - eric
>
