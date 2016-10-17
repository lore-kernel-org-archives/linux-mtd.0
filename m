Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bw2qu-0000r6-EW
 for linux-mtd@lists.infradead.org; Mon, 17 Oct 2016 08:00:57 +0000
Received: by mail-io0-x241.google.com with SMTP id p26so10492037ioo.2
 for <linux-mtd@lists.infradead.org>; Mon, 17 Oct 2016 01:00:40 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161014124928.5a27ed59@bbrezillon>
References: <1476367536-24782-1-git-send-email-geert@linux-m68k.org>
 <20161013162458.0219177b@bbrezillon> <20161014124928.5a27ed59@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Oct 2016 10:00:39 +0200
Message-ID: <CAMuHMdXExe_vUuiuB76Vn-oWVDcdz_gS36M6BVgR5JY--0Uk5Q@mail.gmail.com>
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

On Fri, Oct 14, 2016 at 12:49 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu, 13 Oct 2016 16:24:58 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>> On Thu, 13 Oct 2016 16:05:36 +0200
>> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> >     drivers/mtd/ubi/eba.c: In function =E2=80=98try_recover_peb=E2=80=
=99:
>> >     drivers/mtd/ubi/eba.c:744: warning: =E2=80=98vid_hdr=E2=80=99 is u=
sed uninitialized in this function
>> >
>> > The pointer vid_hdr is indeed not initialized, leading to a crash when
>> > it is dereferenced.
>> >
>> > Fix this by obtaining the pointer from the VID buffer, like is done
>> > everywhere else.
>>
>> Indeed, I don't know how I missed that one :-/.
>
> That's really weird. I tried to recompile the kernel on my machine
> (before applying your patch), to see if the compiler was complaining,
> and it's not :-(.
>
> I also coded simple functions with goto statements, to check that the
> detection was working correctly, and it is.
>
> Maybe you have some ideas why my compiler is failing to detect the
> problem (I'm currently using the ubuntu cross-toolchain:
> 'arm-linux-gnueabi-gcc (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.1) 5.4.0
> 20160609').

It depends highly on the toolchain.

My good old m68k-linux-gnu-gcc version 4.1.2 20061115 (prerelease) (Ubuntu
4.1.1-21) is known to generate plenty of warnings like these. Due to the hi=
gh
percentage of false positives, this was disabled in later versions of gcc, =
but
(partially) re-enabled later (usually Arnd catches most of these while stll=
 in
-next. I'm afraid he's suffering from travelling to Linaro Connect ;-)
Still, some of them are real bugs, so that's when my patch habits kick in..=
.

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
