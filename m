Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTaHA-0005X8-E1
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 16:36:49 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr4so8833057pbb.6
 for <linux-mtd@lists.infradead.org>; Tue, 08 Oct 2013 09:36:27 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20131007165344.GA10162@logfs.org>
References: <524C4CF5.7060601@nsn.com>
 <20131007174943.GB23337@ld-irv-0074.broadcom.com>
 <20131007165344.GA10162@logfs.org>
Date: Tue, 8 Oct 2013 18:36:26 +0200
Message-ID: <CAMuHMdUbQBUg_FgGu_xzmznbjkk4qpHiL=LbOhPGZ1FZ2rP0qA@mail.gmail.com>
Subject: Re: [PATCH] mtd: phram: Make phram 64-bit compatible
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Joern Engel <joern@lazybastard.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@nsn.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 7, 2013 at 6:53 PM, J=C3=B6rn Engel <joern@logfs.org> wrote:
> One possible solution would be to have three suffixes.  Ki for
> base-1024, Kd for base-1000 and K for "I don't care, you decide for
> me".  But I am sure that would simply cause another round of
> flamewars.

Indeed. Why deviate from SI with "Kd" (a new invention)??
That should just be "k".

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
