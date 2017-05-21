MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20170520213654.6b6d18eb@gmail.com>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
 <20170520213654.6b6d18eb@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 21 May 2017 10:37:55 +0200
Message-ID: <CAMuHMdXQ4Tc92njixXKiP_JgasvgFELR15hqFpk4DjvfT453EQ@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 LEDE Development List <lede-dev@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Christoph Hellwig <hch@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 20, 2017 at 9:36 PM, Ralph Sennhauser
<ralph.sennhauser@gmail.com> wrote:
> There is also the size consideration. Unless a seeded ubifs can get
> close to squashfs in terms of compression there would still be a
> use-case for squashfs with an ubifs overlay. My current root as ubifs
> instead of squashfs is 76.8% bigger.

As seeded files are stored and kept unmodified, they could be stored in
compressed form?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
