Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fO8Op-0006HA-Q0
 for linux-mtd@lists.infradead.org; Wed, 30 May 2018 21:12:53 +0000
Received: by mail-ua0-x241.google.com with SMTP id i3-v6so13544247uad.4
 for <linux-mtd@lists.infradead.org>; Wed, 30 May 2018 14:12:40 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20180530134645.GA31844@parrot.com>
References: <20180529224207.GA13354@beast> <20180530134645.GA31844@parrot.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 30 May 2018 14:12:38 -0700
Message-ID: <CAGXu5jK-Z=Ms2mdxmDnA5Gji-tx4HfDGtFRPYNcEwtQC-DzeHw@mail.gmail.com>
Subject: Re: [PATCH] lib/bch: Remove VLA usage
To: Ivan Djelic <ivan.djelic@parrot.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 30, 2018 at 6:46 AM, Ivan Djelic <ivan.djelic@parrot.com> wrote=
:
> On Tue, May 29, 2018 at 03:42:07PM -0700, Kees Cook wrote:
>> In the quest to remove all stack VLA usage from the kernel[1], this remo=
ves
>> the on-stack working buffers in favor of pre-allocated working buffers
>> (which were already used in other places). Since these routines must
>> already be serialized (since they work on bch->ecc_buf), adding the usag=
e
>> of bch->ecc_work would be similarly safe. Additionally, since "max m" is
>> only 15, this was adjusted to just use a fixed size array in those cases=
.
>
> Hi Kees,
>
> Using an on-stack buffer instead of a pre-allocated buffer was done initi=
ally
> for performance reasons.  For "usual" (m,t) values (for instance m=3D13, =
t=3D4),
> there is a huge performance difference between the on-stack buffer versio=
n and
> the kmalloc version. I didn't investigate the reason for this, but I ran =
a
> quick benchmark on my PC:
>
> little-endian, type sizes: int=3D4 long=3D8 longlong=3D8
> cpu: Intel(R) Core(TM) i5 CPU         650  @ 3.20GHz
> calibration: iter=3D4.9143=C2=B5s niter=3D2034 nsamples=3D200 m=3D13 t=3D=
4
>
>   Buffer allocation |  Encoding throughput (Mbit/s)
> ---------------------------------------------------
>  on-stack, VLA      |   3988
>  on-stack, fixed    |   4494
>  kmalloc            |   1967
>
> The first line shows the performance of the current code, using a VLA.
> The second line shows the performance when r[] is allocated on the stack =
with
> a fixed, constant size (the maximum allowed value).
> The third line shows the performance when r is a pre-allocated working bu=
ffer.
>
> In fact, when using a pre-allocated buffer there is no need to introduce =
'ecc_work':
> you can directly point 'r' to bch->ecc_buf and remove memcpy() surroundin=
g the
> 'while (mlen--)' loop. Everything happens inside the 'bch->ecc_buf' buffe=
r.
> But with a big performance penalty. Looks like declaring a temporary buff=
er on the
> stack to store ECC values allows GCC to do a better job at optimizing the=
 loop.
>
> So rather than introducing 'ecc_work', I suggest we compute the maximum a=
llowed
> size for r[] and use that:
>
> sizeof(r) =3D sizeof(uint32_t)*(l+1)
> l+1 =3D BCH_ECC_WORDS(bch) =3D DIV_ROUND_UP(m*t, 32)
>
> We also know that:
>
> m*t < 2^m - 1 (ECC maximum size)
>
> therefore:
>
> l+1 < DIV_ROUND_UP(2^m - 1, 32) < 2^(m-5)
>
> So instead of 'uint32_t r[l+1]' we could declare 'uint32_t r[1 << (BCH_MA=
X_M-5)]'.
> And replace 'sizeof(r)' with 'sizeof(*bch->ecc_buf)*(l+1)' in memset/memc=
py calls.
> In practice the actual maximum size of r[] is (1 << (15-5))*sizeof(uint32=
_t) =3D 4096 bytes.
>
> What do you think ?

I actually did that implementation first since I didn't realize how
large that allocation could get. 4096 is a HUGE stack allocation. The
kernel build warns at 2048. The defaults seen during allmodconfig are:

CONFIG_BCH_CONST_M=3D14
CONFIG_BCH_CONST_T=3D4

So those builds are already seeing a large stack allocation, but it
was hidden from the checking tools before because it was a dynamic
stack allocation:

lib/bch.c: In function =E2=80=98encode_bch=E2=80=99:
lib/bch.c:261:1: warning: the frame size of 2288 bytes is larger than
2048 bytes [-Wframe-larger-than=3D]

This could be masked in the Makefile, though, since this is already
the situation the code runs under. I'll send that patch...

-Kees

--=20
Kees Cook
Pixel Security
