Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqDku-0004xa-W1
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 23:27:13 +0000
Received: by wwb24 with SMTP id 24so3690321wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 16:27:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1283172749.12995.70.camel@brekeke>
References: <20100827025523.GA10688@july> <1283172749.12995.70.camel@brekeke>
Date: Tue, 31 Aug 2010 08:27:11 +0900
Message-ID: <AANLkTinDPN4bw=2VfwXjKoaXW69m+_oUUq8yH-hvM9oT@mail.gmail.com>
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

On Mon, Aug 30, 2010 at 9:52 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
>> Kyungmin Park (3):
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Remove unused cmd_map at s5pc110
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix loop hang when DMA error at Samsu=
ng SoCs
>> =C2=A0 =C2=A0 =C2=A0 MTD: OneNAND: Fix 2KiB pagesize handling at Samsung=
 SoCs
>>
>> =C2=A0drivers/mtd/onenand/samsung.c | =C2=A0 17 +++++++----------
>> =C2=A01 files changed, 7 insertions(+), 10 deletions(-)
>
> Taken patches 1 and 3, requested a change for patch 2. Pushed patches 1
> and 3 to l2-mtd-2.6.git / dunno, thanks.

To David, Artem,
Can you include these patches to linux-2.6.36-rc4? since it's bug fixes.

How do you think?

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
