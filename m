Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGuha-0004QM-Nz
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 18:52:15 +0000
Received: by mail-lb0-f169.google.com with SMTP id s7so6310363lbd.28
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 11:51:51 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20140811175036.GU3711@ld-irv-0074>
References: <1407604073-7484-1-git-send-email-geert@linux-m68k.org>
 <20140811175036.GU3711@ld-irv-0074>
Date: Mon, 11 Aug 2014 20:51:51 +0200
Message-ID: <CAMuHMdUNoD5qFhfVP2jJvgqPi=c6xe6YAbmQWYt_ir7rtqp_OQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Use ULL-suffix for big u64 constant
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Mon, Aug 11, 2014 at 7:50 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sat, Aug 09, 2014 at 07:07:53PM +0200, Geert Uytterhoeven wrote:
>> drivers/mtd/nand/nand_timings.c:45: warning: integer constant is too lar=
ge for =E2=80=98long=E2=80=99 type
>
> On what compiler / static analyzer?

Any 32-bit version of gcc at the standard warning level, at least
until gcc 4.4.7.
With gcc 4.6 it's indeed gone.

>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  drivers/mtd/nand/nand_timings.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/nand_timings.c b/drivers/mtd/nand/nand_tim=
ings.c
>> index 8b36253420fa..e81470a8ac67 100644
>> --- a/drivers/mtd/nand/nand_timings.c
>> +++ b/drivers/mtd/nand/nand_timings.c
>> @@ -42,7 +42,7 @@ static const struct nand_sdr_timings onfi_sdr_timings[=
] =3D {
>>               .tRHZ_max =3D 200000,
>>               .tRLOH_min =3D 0,
>>               .tRP_min =3D 50000,
>> -             .tRST_max =3D 250000000000,
>> +             .tRST_max =3D 250000000000ULL,
>
> See [1] and [2]. I'm pretty sure it is a bug in your tool to warn about

Yes, I saw those, after I had created my patch. I decided to send it anyway=
 ;-)

> this. The C standard seems pretty clear that the large literal constant
> is automatically promoted to a sufficiently large type, so AIUI there
> should be no need for such a warning. A standards-compliant compiler
> will do the right thing.

Actually I didn't know there existed versions of gcc that did _not_ give
this warning. This seems to be a recent thing on gcc for 32-bit targets.
For 64-bit targets, apparently it only gives a warning if the constant
is that large that it can no longer fit in a 64-bit signed integer.

> However, I could be convinced to apply this, if only to satisfy broken
> tools and to avoid addressing this question over and over...

So please apply. Too many people are still using 32-bit targets and
gcc < 4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
