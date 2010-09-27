Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0AeB-0001cq-5q
	for linux-mtd@lists.infradead.org; Mon, 27 Sep 2010 10:09:25 +0000
Received: by wwb24 with SMTP id 24so4443917wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 03:09:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1284834597.1721.70.camel@brekeke>
References: <20100827025523.GA10688@july> <1283172749.12995.70.camel@brekeke>
	<AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
	<1283296419.2018.47.camel@brekeke>
	<AANLkTik-Fr0mvA8jM2RrLD7VzEmJN=reeqwkOcATjVXY@mail.gmail.com>
	<1283336933.1958.3.camel@brekeke>
	<AANLkTi=KDK0d31WhpnN3xktqyFiB4S0kULohViz5fBXf@mail.gmail.com>
	<1284834597.1721.70.camel@brekeke>
Date: Mon, 27 Sep 2010 19:09:20 +0900
Message-ID: <AANLkTimo_6ZgnAnzCH4LfdbZbLsgEJ1r9ehQFiD1K8ay@mail.gmail.com>
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

Hi,

Sorry for late reply. it's holiday at korea.

I posted some fixes and improvements.
you can find onenand patches at git here.
http://git.infradead.org/users/kmpark/linux-2.6-samsung/shortlog/refs/heads=
/onenand

Thank you,
Kyungmin Park

On Sun, Sep 19, 2010 at 3:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2010-09-01 at 19:37 +0900, Kyungmin Park wrote:
>> On Wed, Sep 1, 2010 at 7:28 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
>> > On Wed, 2010-09-01 at 11:35 +0900, Kyungmin Park wrote:
>> >> On Wed, Sep 1, 2010 at 8:13 AM, Artem Bityutskiy <dedekind1@gmail.com=
> wrote:
>> >> > On Tue, 2010-08-31 at 08:27 +0900, Kyungmin Park wrote:
>> >> >> On Mon, Aug 30, 2010 at 9:52 PM, Artem Bityutskiy <dedekind1@gmail=
.com> wrote:
>> >> >> > On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
>> >> >> >> Kyungmin Park (3):
>> >> >> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Remove unused cmd_map at s5p=
c110
>> >> >> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix loop hang when DMA error=
 at Samsung SoCs
>> >> >> >> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix 2KiB pagesize handling a=
t Samsung SoCs
>> >> >> >>
>> >> >> >> =C2=A0drivers/mtd/onenand/samsung.c | =C2=A0 17 +++++++--------=
--
>> >> >> >> =C2=A01 files changed, 7 insertions(+), 10 deletions(-)
>> >> >> >
>> >> >> > Taken patches 1 and 3, requested a change for patch 2. Pushed pa=
tches 1
>> >> >> > and 3 to l2-mtd-2.6.git / dunno, thanks.
>> >> >>
>> >> >> To David, Artem,
>> >> >> Can you include these patches to linux-2.6.36-rc4? since it's bug =
fixes.
>> >> >>
>> >> >> How do you think?
>> >> >
>> >> > Note, Linus nowadays tends to be stricter about what goes in -rc. W=
hy
>> >> > would the first patch be a fix deserving urgent merging?
>> >>
>> >> There's no problem with s5pc110 since there's no DMA error. but new
>> >> SOC s5pc210 has some problem with DMA.
>> >> it occurs the DMA error and can't exit the loop. as it's decided to
>> >> use the 2.6.36 for s5pc210 we need to fix it ASAP.
>> >>
>> >> >
>> >> > About the second patch, what if you was mistaken and 20msces is not
>> >> > enough sometimes? Don't you afraid to introduce another bug with th=
is?
>> >> If it takes more then 20msec it's really slow device. I think I give
>> >> the enough time to transfer 2KiB or 4KiB pagesize transfer at DMA.
>> >>
>> >> I'll measure the real time, how much time taken at 2.6.35 kernel and
>> >> give exact number.
>> >>
>> >> >
>> >> > Probably for 2.6.36 the older version of your patch can be merged, =
and
>> >> > then you can add timeout support on top?
>> >>
>> >> Now I implemented it as DMA polling method, but also implemented the
>> >> DMA interrupt codes. as it's new implementation. I don't expect it
>> >> can't merge at this windows. so send fixed codes.
>> >
>> > I am not sure I completely understand what you mean. but lets play saf=
e
>> > and merge your original version, because it is small and just fixes th=
e
>> > problem. Adding timeout is an improvement, and for this very simple
>> > reason it should not go to 2.6.36.
>> >
>> > Please, clone my l2 tree
>> > (http://git.infradead.org/users/dedekind/l2-mtd-2.6.git), checkout the
>> > 'for-2.6.36' branch, add timeout, and send it to me as as a separate
>> > independent patch. I'll take care of it then.
>> >
>> > Would you do this please?
>>
>> No problem,
>
> Still waiting for the patch which adds timeout.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
