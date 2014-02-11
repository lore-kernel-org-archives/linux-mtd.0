Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDATt-00061B-21
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 10:22:21 +0000
Received: by mail-pb0-f54.google.com with SMTP id uo5so7590301pbc.27
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 02:21:58 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <87zjlyugqq.fsf@dell.be.48ers.dk>
References: <52F6C916.2030506@nod.at> <20140209075157.GJ22376@1wt.eu>
 <20140210024827.GB9643@localhost>
 <1392017750.31031.8.camel@sauron.fi.intel.com>
 <20140210082714.GB10872@localhost> <20140210084616.GP22376@1wt.eu>
 <20140210142026.GB15607@localhost>
 <1392043814.32363.49.camel@sauron.fi.intel.com>
 <20140210184858.GA6484@localhost>
 <a86d653a-9e3b-46dc-9ec8-94a9c1099bec@email.android.com>
 <20140210214333.GH28464@1wt.eu>
 <CAMuHMdW0LHpWmyHUaAviSBDk87=wu8dkzATS9qOB5mDcR=SkSA@mail.gmail.com>
 <87zjlyugqq.fsf@dell.be.48ers.dk>
Date: Tue, 11 Feb 2014 11:21:57 +0100
Message-ID: <CAMuHMdVyKkYvxbVGna9L0zZKPRjwU9b0WpBGPYzBPtrjp1Mmng@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 11, 2014 at 10:43 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>  >> Disable Caching (default N, say Y to save memory)
>  >> Disable Write support (default N, say Y to reduce code size)
>
>  > But then allmodconfig builds will not exercise those code paths.
>
>  > Don't you want:
>
>  >     bool "Enable Caching" if !EXPERT
>  >     default y
>
>  >     bool "Enable Write support" if !EXPERT
>  >     default y
>
> Ehh, those should be EXPERT, not !EXPERT, right?

Yes, sorry for the mistake.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
