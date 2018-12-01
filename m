Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT0Vp-0003lq-E5
 for linux-mtd@lists.infradead.org; Sat, 01 Dec 2018 08:20:31 +0000
Received: by mail-vs1-f66.google.com with SMTP id b74so4755816vsd.9
 for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2018 00:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
 <CAGXu5j+jBNBsD3pvUSfEh6Lc5T1YMpbM0HeG1c6BHiJe+cKVOQ@mail.gmail.com>
 <20181130195652.7syqys76646kpaph@linux-r8p5>
 <20181130205521.GA21006@linux.intel.com>
 <1543611662.3031.20.camel@HansenPartnership.com>
 <20181130214405.GG23772@linux.intel.com>
 <1543615069.3031.27.camel@HansenPartnership.com>
 <20181130221219.GA25537@linux.intel.com>
 <20181130151459.3ca2f5c8@lwn.net>
In-Reply-To: <20181130151459.3ca2f5c8@lwn.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 1 Dec 2018 09:20:03 +0100
Message-ID: <CAMuHMdUkpLWm5NZmYj=uMgVncw6ZOb7j9KxFoDGhrnr7vzpx_w@mail.gmail.com>
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, amir73il@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Axtens <dja@axtens.net>, "David S. Miller" <davem@davemloft.net>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Dumazet <edumazet@google.com>,
 federico.vaga@vaga.pv.it, Geert Uytterhoeven <geert+renesas@glider.be>,
 Helge Deller <deller@gmx.de>, Joshua Kinard <kumba@gentoo.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 linux-ide@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 scsi <linux-scsi@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev <netdev@vger.kernel.org>, nouveau@lists.freedesktop.org,
 pabeni@redhat.com,
 Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>,
 Rob Herring <robh@kernel.org>,
 sean.wang@mediatek.com, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 shannon.nelson@oracle.com, Stefano Brivio <sbrivio@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, "Tobin C. Harding" <me@tobin.cc>,
 makita.toshiaki@lab.ntt.co.jp,
 Willem de Bruijn <willemb@google.com>, yhs@fb.com, yanjun.zhu@oracle.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jon,

On Fri, Nov 30, 2018 at 11:15 PM Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 30 Nov 2018 14:12:19 -0800
> Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
>
> > As a maintainer myself (and based on somewhat disturbed feedback from
> > other maintainers) I can only make the conclusion that nobody knows what
> > the responsibility part here means.
> >
> > I would interpret, if I read it like at lawyer at least, that even for
> > existing code you would need to do the changes postmorterm.
> >
> > Is this wrong interpretation?  Should I conclude that I made a mistake
> > by reading the CoC and trying to understand what it *actually* says?
> > After this discussion, I can say that I understand it less than before.
>
> Have you read Documentation/process/code-of-conduct-interpretation.rst?
> As has been pointed out, it contains a clear answer to how things should
> be interpreted here.

Indeed:

| Contributions submitted for the kernel should use appropriate language.
| Content that already exists predating the Code of Conduct will not be
| addressed now as a violation.

However:

| Inappropriate language can be seen as a
| bug, though; such bugs will be fixed more quickly if any interested
| parties submit patches to that effect.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
