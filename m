Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bw5p6-0007ge-RD
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 11:11:18 +0000
Received: by mail-io0-x241.google.com with SMTP id o141so10678137ioe.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2016 04:10:56 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161017130218.1d2e19e3@bbrezillon>
References: <1476367536-24782-1-git-send-email-geert@linux-m68k.org>
 <20161013162458.0219177b@bbrezillon>
 <CAMuHMdVJJxN2bU6JVsia9uDMonczqMw3SiAu-eygnHVLUqcqMg@mail.gmail.com>
 <20161017130218.1d2e19e3@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Oct 2016 13:10:55 +0200
Message-ID: <CAMuHMdX+2TG8STTJJH9FTTN_hOXYgV4H2TaBOxo+nVeUZL+aug@mail.gmail.com>
Subject: Re: [PATCH] UBI: Fix crash in try_recover_peb()
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Oct 17, 2016 at 1:02 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 17 Oct 2016 10:00:25 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Thu, Oct 13, 2016 at 4:24 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > On Thu, 13 Oct 2016 16:05:36 +0200
>> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> >
>> >>     drivers/mtd/ubi/eba.c: In function =E2=80=98try_recover_peb=E2=80=
=99:
>> >>     drivers/mtd/ubi/eba.c:744: warning: =E2=80=98vid_hdr=E2=80=99 is =
used uninitialized in this function
>> >>
>> >> The pointer vid_hdr is indeed not initialized, leading to a crash whe=
n
>> >> it is dereferenced.
>> >>
>> >> Fix this by obtaining the pointer from the VID buffer, like is done
>> >> everywhere else.
>> >
>> > Indeed, I don't know how I missed that one :-/.
>> >
>> >>
>> >> Fixes: 3291b52f9ff0acc8 ("UBI: introduce the VID buffer concept")
>> >> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> >
>> > One minor comment below, otherwise
>> >
>> > Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>
>> Thanks!
>>
>> >> ---
>> >> Completely untested. And I know nothing about UBI ;-)
>> >> ---
>> >>  drivers/mtd/ubi/eba.c | 1 +
>> >>  1 file changed, 1 insertion(+)
>> >>
>> >> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
>> >> index 95c4048a371e87b6..388e46be6ad92805 100644
>> >> --- a/drivers/mtd/ubi/eba.c
>> >> +++ b/drivers/mtd/ubi/eba.c
>> >> @@ -741,6 +741,7 @@ static int try_recover_peb(struct ubi_volume *vol=
, int pnum, int lnum,
>> >>               goto out_put;
>> >>       }
>> >>
>> >> +     vid_hdr =3D ubi_get_vid_hdr(vidb);
>> >
>> > Can you move this assignment at variable declaration time?
>>
>> I can do that. However, that moves the call to ubi_get_vid_hdr() _before=
_
>> the call to ubi_io_read_vid_hdr().
>>
>> While that would still work (ubi_get_vid_hdr() would just return a point=
er to
>> the not-yet-read data), I think it's better to not move it, to prevent p=
eople
>> from accidentally trying to use it before the data has been read.
>
> Well, maybe. I just thought it would be safer to assign it as early as
> possible to avoid another 'uninitialized var' bug if move code around
> again (which will happen soon ;-)).

I prefer seeing the warning again (I _will_ notice if it pops up again!) ov=
er
failing at runtime because the data structure it points to hasn't been
initialized yet, which the compiler can't warn me about...

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
