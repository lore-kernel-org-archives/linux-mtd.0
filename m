Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkyaY-0007di-34
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 12:14:50 +0000
Received: by wyb34 with SMTP id 34so6396418wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Aug 2010 05:14:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281954738.21549.65.camel@localhost>
References: <1281946149.10299.1.camel@mola>
	<1281954738.21549.65.camel@localhost>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 16 Aug 2010 20:14:27 +0800
Message-ID: <AANLkTingMJHJPwh5BeAKT___R2kE4t_XZoobuFrEsaHu@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] pxa3xx: fix ns2cycle equation
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Axel Lin <axel.lin@gmail.com>, Matt Reimer <mreimer@vpop.net>,
	linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 16, 2010 at 6:32 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Mon, 2010-08-16 at 16:09 +0800, Axel Lin wrote:
>> Test on a PXA310 platform with Samsung K9F2G08X0B NAND flash,
>> with tCH=3D5 and clk is 156MHz, ns2cycle(5, 156000000) returns -1.
>>
>> ns2cycle returns negtive value will break NDTR0_tXX macros.
>>
>> After checking the commit log, I found the problem is introduced by
>> commit 5b0d4d7c8a67c5ba3d35e6ceb0c5530cc6846db7
>> "[MTD] [NAND] pxa3xx: convert from ns to clock ticks more accurately"
>>
>> To get num of clock cycles, we use below equation:
>> num of clock cycles =3D time (ns) / one clock cycle (ns) + 1
>> We need to add 1 cycle here because integer division will truncate the r=
esult.
>> It is possible the developers set the Min values in SPEC for timing sett=
ings.
>> Thus the truncate may cause problem, and it is safe to add an extra cycl=
e here.
>>
>> The various fields in NDTR{01} are in units of clock ticks minus one,
>> thus we should subtract 1 cycle then.
>>
>> Thus the correct equation should be:
>> num of clock cycles =3D time (ns) / one clock cycle (ns) + 1 - 1
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D time (ns) / one clock cycle (ns)
>
> Looks sane to me; thanks. Wants to go to stable@ too, yes?
>
> Can I have an Acked-By: from Matt and/or Eric?
>

Acked-by: Eric Miao <eric.y.miao@gmail.com>
