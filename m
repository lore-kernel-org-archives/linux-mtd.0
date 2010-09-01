Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqd3m-0006sZ-1Y
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 02:28:22 +0000
Received: by wwb24 with SMTP id 24so5260409wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 19:28:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1283295755.2018.36.camel@brekeke>
References: <20100830234801.GA16862@july>
	<1283295755.2018.36.camel@brekeke>
Date: Wed, 1 Sep 2010 11:28:20 +0900
Message-ID: <AANLkTi=y0Mjos8F2=QrMYWD8xQqPhtTQOD83etUNeXdz@mail.gmail.com>
Subject: Re: [PATCH v2] MTD: OneNAND: Fix loop hang when DMA error at Samsung
	SoCs
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

On Wed, Sep 1, 2010 at 8:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Tue, 2010-08-31 at 08:48 +0900, Kyungmin Park wrote:
>> =C2=A0 =C2=A0 =C2=A0 writel(S5PC110_DMA_TRANS_CMD_TR, base + S5PC110_DMA=
_TRANS_CMD);
>>
>> + =C2=A0 =C2=A0 timeout =3D jiffies + msec_to_jiffies(20);
>
> Are you completely absolutely 100% totally sure 20msecs is enough?

Actually there's no mention about the timeout time in the Spec. but I
tested it both s5pc110 and s5pc210. and working well.

No matter increase the time but I give the 4 chance to the DMA
routine. since we got the 5msec times. and in case of s5pc110 it's
implemented the HRT. so it's really enough.

If the DMA takes more time than 20msec, it's really slow devices and
can't use it. as you know the real transfer size is 2KiB or 4KiB.

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
