Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgtMH-0008Pq-Cs
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 05:51:14 +0000
Received: by wwi14 with SMTP id 14so6793579wwi.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 22:51:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1280982776.4363.18.camel@localhost.localdomain>
References: <20100727103937.GA1247@july>
	<1280982776.4363.18.camel@localhost.localdomain>
Date: Thu, 5 Aug 2010 14:51:11 +0900
Message-ID: <AANLkTikV8ypbpainB7toPPeq7n6Q1P7ZDwL4Uf89q9dP@mail.gmail.com>
Subject: Re: [PATCH] S5PC110: Add OneNAND interrupt number
From: Kyungmin Park <kmpark@infradead.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: kgene.kim@samsung.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 5, 2010 at 1:32 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Tue, 2010-07-27 at 19:39 +0900, Kyungmin Park wrote:
>> To use OneNAND interrupt at drivers, also extend DMA address to cover fu=
lly.
>>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> diff --git a/arch/arm/mach-s5pv210/dev-onenand.c b/arch/arm/mach-s5pv210=
/dev-onenand.c
>> index 34997b7..f8ede33 100644
>> --- a/arch/arm/mach-s5pv210/dev-onenand.c
>> +++ b/arch/arm/mach-s5pv210/dev-onenand.c
>> @@ -27,9 +27,14 @@ static struct resource s5pc110_onenand_resources[] =
=3D {
>> =A0 =A0 =A0 },
>> =A0 =A0 =A0 [1] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D S5PC110_PA_ONENAND_DMA,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND_DMA + SZ_2K=
 - 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D S5PC110_PA_ONENAND_DMA + SZ_8K=
 - 1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM,
>> =A0 =A0 =A0 },
>> + =A0 =A0 [2] =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D IRQ_ONENAND_AUDI,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D IRQ_ONENAND_AUDI,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ,
>> + =A0 =A0 },
>> =A0};
>
> You do not expect this to go through the MTD tree, right?

After this patch, I did a lot of works but failed to persuade the Kukjin.
At this time. it's okay only this patch to mtd tree.

Kukjin, are you okay?
Since It's only affect the c110.

Thank you,
Kyungmin Park
