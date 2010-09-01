Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqdSq-0000m0-7G
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 02:54:17 +0000
Received: by wyb38 with SMTP id 38so7872836wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 19:54:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <AANLkTik-Fr0mvA8jM2RrLD7VzEmJN=reeqwkOcATjVXY@mail.gmail.com>
References: <20100827025523.GA10688@july> <1283172749.12995.70.camel@brekeke>
	<AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
	<1283296419.2018.47.camel@brekeke>
	<AANLkTik-Fr0mvA8jM2RrLD7VzEmJN=reeqwkOcATjVXY@mail.gmail.com>
Date: Wed, 1 Sep 2010 11:54:15 +0900
Message-ID: <AANLkTi=ATR1a_Yz8g3MTPdkkWyXDX0gWipNRpB+5YA1j@mail.gmail.com>
Subject: Re: [PATCH 0/3] MTD: OneNAND: Fix OneNAND DMA error handling and 2KiB
	pagesize
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 1, 2010 at 11:35 AM, Kyungmin Park <kmpark@infradead.org> wrote=
:
> On Wed, Sep 1, 2010 at 8:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
>> On Tue, 2010-08-31 at 08:27 +0900, Kyungmin Park wrote:
>>> On Mon, Aug 30, 2010 at 9:52 PM, Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
>>> > On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
>>> >> Kyungmin Park (3):
>>> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Remove unused cmd_map at s5pc110
>>> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix loop hang when DMA error at S=
amsung SoCs
>>> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix 2KiB pagesize handling at Sam=
sung SoCs
>>> >>
>>> >> =C2=A0drivers/mtd/onenand/samsung.c | =C2=A0 17 +++++++----------
>>> >> =C2=A01 files changed, 7 insertions(+), 10 deletions(-)
>>> >
>>> > Taken patches 1 and 3, requested a change for patch 2. Pushed patches=
 1
>>> > and 3 to l2-mtd-2.6.git / dunno, thanks.
>>>
>>> To David, Artem,
>>> Can you include these patches to linux-2.6.36-rc4? since it's bug fixes=
.
>>>
>>> How do you think?
>>
>> Note, Linus nowadays tends to be stricter about what goes in -rc. Why
>> would the first patch be a fix deserving urgent merging?
>
> There's no problem with s5pc110 since there's no DMA error. but new
> SOC s5pc210 has some problem with DMA.
> it occurs the DMA error and can't exit the loop. as it's decided to
> use the 2.6.36 for s5pc210 we need to fix it ASAP.
>
>>
>> About the second patch, what if you was mistaken and 20msces is not
>> enough sometimes? Don't you afraid to introduce another bug with this?
> If it takes more then 20msec it's really slow device. I think I give
> the enough time to transfer 2KiB or 4KiB pagesize transfer at DMA.
>
> I'll measure the real time, how much time taken at 2.6.35 kernel and
> give exact number.

Unit is usec, so it takes 20 usec for 2KiB pagesize transfer. I use
the msec for some board don't implement the HRT or based on 10msec
timer. I give the 2 chances. As 10 msec can miss the time.
[   11.402082] s5pc210_dma_ops[575] 19
[   11.404445] s5pc210_dma_ops[575] 21
[   11.408790] s5pc210_dma_ops[575] 21
[   11.415221] s5pc210_dma_ops[575] 22
[   11.417433] s5pc210_dma_ops[575] 19
[   11.420867] s5pc210_dma_ops[575] 21
[   11.427553] s5pc210_dma_ops[575] 22
[   11.429736] s5pc210_dma_ops[575] 21
[   11.435615] s5pc210_dma_ops[575] 19
[   11.437885] s5pc210_dma_ops[575] 21
[   11.443540] s5pc210_dma_ops[575] 21
[   11.445726] s5pc210_dma_ops[575] 21
[   11.487652] s5pc210_dma_ops[575] 20
[   11.501755] s5pc210_dma_ops[575] 22
[   11.503941] s5pc210_dma_ops[575] 21
[   11.508539] s5pc210_dma_ops[575] 21
[   11.510879] s5pc210_dma_ops[575] 19
[   11.515527] s5pc210_dma_ops[575] 21
[   11.517840] s5pc210_dma_ops[575] 19
[   11.521170] s5pc210_dma_ops[575] 19
[   11.526044] s5pc210_dma_ops[575] 21
[   11.575904] s5pc210_dma_ops[575] 19

>
>>
>> Probably for 2.6.36 the older version of your patch can be merged, and
>> then you can add timeout support on top?
>
> Now I implemented it as DMA polling method, but also implemented the
> DMA interrupt codes. as it's new implementation. I don't expect it
> can't merge at this windows. so send fixed codes.
>
>>
>> Third patch is probably ok, if you really want it in 2.6.36.
>>
>> So, I've moved the third patch to l2-mtd-2.6.git / for-2.6.36, I've left
>> the first patch in the dunno branch, and I also put the original version
>> of the second patch to the for-2.6.36 branch.
>>
>> Please, add timeout on top of l2-mtd-2.6.git / for-2.6.36 and send it.
>> I'll then take care of it, or at least try.
>
> Thank you,
> Kyungmin Park
>>
>> --
>> Best Regards,
>> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=
=90=D1=80=D1=82=D1=91=D0=BC)
>>
>>
>
