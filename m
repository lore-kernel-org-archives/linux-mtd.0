Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0Ev-0006vq-Sk
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:21:18 +0000
Received: by oiav1 with SMTP id v1so9040452oia.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2015 03:20:56 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1426095891-17827-1-git-send-email-fabf@skynet.be>
References: <1426095891-17827-1-git-send-email-fabf@skynet.be>
Date: Thu, 12 Mar 2015 11:20:56 +0100
Message-ID: <CAMuHMdVZxNVrqwAzKdipSZbBOX6n29tthJ7fzN4Cm+nJ6d1mXQ@mail.gmail.com>
Subject: Re: [PATCH 1/1 linux-next] UBIFS: simplify returns
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Fabian Frederick <fabf@skynet.be>
Content-Type: text/plain; charset=UTF-8
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabian,

On Wed, Mar 11, 2015 at 6:44 PM, Fabian Frederick <fabf@skynet.be> wrote:
> @@ -1002,13 +999,9 @@ static int clean_an_unclean_leb(struct ubifs_info *c,
>
>         dbg_rcvry("LEB %d len %d", lnum, len);
>
> -       if (len == 0) {
> +       if (len == 0)
>                 /* Nothing to read, just unmap it */
> -               err = ubifs_leb_unmap(c, lnum);
> -               if (err)
> -                       return err;
> -               return 0;
> -       }
> +               return ubifs_leb_unmap(c, lnum);

While technically the curly braces are no longer needed, I'd keep them
because of the comment line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
