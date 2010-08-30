Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq4cQ-0006IA-KE
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 13:41:51 +0000
Received: by wyb38 with SMTP id 38so5507642wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 06:41:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1283172597.12995.68.camel@brekeke>
References: <20100827025537.GA10698@july> <1283172597.12995.68.camel@brekeke>
Date: Mon, 30 Aug 2010 22:41:48 +0900
Message-ID: <AANLkTi=v8ZpmNG_7rOKYRydU2DzDB+_41YCjyq87zTiZ@mail.gmail.com>
Subject: Re: [PATCH 2/3] MTD: OneNAND: Fix loop hang when DMA error at Samsung
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

On Mon, Aug 30, 2010 at 9:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2010-08-27 at 11:55 +0900, Kyungmin Park wrote:
>> From: Kyungmin Park <kyungmin.park@samsung.com>
>>
>> When DMA error occurs. it's loop hang since it can't exit the loop.
>> and it's the right DMA handling code as Spec.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =C2=A0drivers/mtd/onenand/samsung.c | =C2=A0 11 +++++------
>> =C2=A01 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung=
.c
>> index 05329ba..69e48d0 100644
>> --- a/drivers/mtd/onenand/samsung.c
>> +++ b/drivers/mtd/onenand/samsung.c
>> @@ -554,14 +554,13 @@ static int s5pc110_dma_ops(void *dst, void *src, s=
ize_t count, int direction)
>>
>> =C2=A0 =C2=A0 =C2=A0 do {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D readl(base +=
 S5PC110_DMA_TRANS_STATUS);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (status & S5PC110_DMA_TRA=
NS_STATUS_TE) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
writel(S5PC110_DMA_TRANS_CMD_TEC,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base + S5PC110_DMA_=
TRANS_CMD);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return -EIO;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 } while (!(status & S5PC110_DMA_TRANS_STATUS_TD));
>>
>> - =C2=A0 =C2=A0 if (status & S5PC110_DMA_TRANS_STATUS_TE) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(S5PC110_DMA_TRANS_CMD=
_TEC, base + S5PC110_DMA_TRANS_CMD);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(S5PC110_DMA_TRANS_CMD=
_TDC, base + S5PC110_DMA_TRANS_CMD);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>> - =C2=A0 =C2=A0 }
>> -
>> =C2=A0 =C2=A0 =C2=A0 writel(S5PC110_DMA_TRANS_CMD_TDC, base + S5PC110_DM=
A_TRANS_CMD);
>
> You shoule also add timeout to the loop. Forever loops are bad. Please,
> while you are on it, fix the forever loop by doing something like this:
> http://patchwork.ozlabs.org/patch/59180/
> I mean, add timeout please.

No problem, I will update this patch tomorrow.

Thank you,
Kyungmin Park
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
