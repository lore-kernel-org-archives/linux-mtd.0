Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWRaM-00064i-Nr
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 15:33:15 +0000
Received: by oiav63 with SMTP id v63so16944415oia.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 Mar 2015 08:32:52 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1426192461-16011-1-git-send-email-fabf@skynet.be>
References: <1426192461-16011-1-git-send-email-fabf@skynet.be>
Date: Fri, 13 Mar 2015 16:32:52 +0100
Message-ID: <CAMuHMdVr2pJhTVc7NTJD_h46X8Lu=48FgaRJw+ahULL=JDjJ+g@mail.gmail.com>
Subject: Re: [PATCH V2 linux-next] UBIFS: simplify returns
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

On Thu, Mar 12, 2015 at 9:34 PM, Fabian Frederick <fabf@skynet.be> wrote:
> directly return recover_head() and ubifs_leb_unmap()
> instead of storing value in err and testing it.
>
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
