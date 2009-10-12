Received: from mail-qy0-f187.google.com ([209.85.221.187])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxBUv-0007yd-Bk
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 03:23:05 +0000
Received: by qyk17 with SMTP id 17so9867400qyk.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Oct 2009 20:22:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1255265475.16942.48.camel@localhost>
References: <1254907903-11797-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1255265475.16942.48.camel@localhost>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 12 Oct 2009 11:22:32 +0800
Message-ID: <f17812d70910112022g63c60438jca2a0e47944813a5@mail.gmail.com>
Subject: Re: [PATCH] pxa3xx_nand: fix time calculation
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, mreimer@vpop.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 11, 2009 at 8:51 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2009-10-07 at 11:31 +0200, Enrico Scholz wrote:
>> Use DIV_ROUND_UP to calculate number of clocks. =C2=A0Else, calculated c=
locks
>> are nearly always to low and for times < 10ns, they will be negative on
>> PXA320 =C2=A0(which has a nand clock of 104 MHz).
>>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c
>> index 6ea520a..32cb4d1 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -316,7 +316,7 @@ static struct pxa3xx_nand_flash *builtin_flash_types=
[] =3D {
>> =C2=A0#define tAR_NDTR1(r) (((r) >> 0) & 0xf)
>>
>> =C2=A0/* convert nano-seconds to nand flash controller clock cycles */
>> -#define ns2cycle(ns, clk) =C2=A0 =C2=A0(int)(((ns) * (clk / 1000000) / =
1000) - 1)
>> +#define ns2cycle(ns, clk) =C2=A0 =C2=A0(int)(DIV_ROUND_UP((ns) * (clk /=
 1000000), 1000) - 1)
>
> Why there is -1 at the end?
>

This is because the actual clock cycles are what in the register + 1.

Enrico,

I'd recommend we remove this '-1' to always make the final result
a little bit larger and avoid the negative case. DIV_ROUND_UP() is
kind of confusing here, since the original equation is:

cycles =3D ns / (1/clk * 10^9) =3D ns * clk / 10^9

And since clk is normally N * MHz, thus clk/1000,000 will most likely
be an integer, and simplified to (ns * clk/1000,000) / 1000.

My rough guess is that removing '-1' would suffice for most cases, e.g.
with 104MHz NAND controller frequency:
  9ns =3D 9 * 104 / 1000 =3D 0, which is fine (as 0+1 =3D 1cycle ~ 1000/104=
 ns), and
10ns =3D 10 * 104/1000 =3D 1, which is acceptable as 1 + 1 =3D 2cycle ~ 200=
0/104ns

Could you please verify that removing '-1' will solve all corner cases? Tha=
nks.
