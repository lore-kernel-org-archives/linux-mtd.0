Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0poy-000396-TU
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 10:57:41 +0000
Received: by mail-lb0-f171.google.com with SMTP id w7so6458969lbi.30
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 02:57:18 -0800 (PST)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <548F086B.3090607@gmail.com>
References: <548F086B.3090607@gmail.com>
Date: Tue, 16 Dec 2014 11:57:18 +0100
Message-ID: <CAMuHMdU1DQBcq5AiVYaT8m3b7x_HFa6SMy-KOw5m7W=S8LPrJw@mail.gmail.com>
Subject: Re: Cannot find jffs2_commit_write
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: nick <xerofoify@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nick,

On Mon, Dec 15, 2014 at 5:12 PM, nick <xerofoify@gmail.com> wrote:
> I seem to not be able to locate jffs2_commit_write by searching with lxr. If someone can tell me what file the function is located in that would be greatly appreciated.

That's because it does not exist. Presumably someone forgot to update
an error message when it was renamed (before it entered mainline in ... 2002!

BTW, please clone Linus' git tree instead of lurking in lxr for real development
(I assume that's what you want to do? ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
