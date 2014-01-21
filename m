Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5dv1-0002CN-Pp
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2014 16:11:16 +0000
From: Marek Vasut <marex@denx.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/4] mtd: m25p80: Enable Dual SPI read transfers for
 s25fl256s1 and s25fl512s
Date: Tue, 21 Jan 2014 17:10:53 +0100
References: <1390309159-19643-1-git-send-email-geert@linux-m68k.org>
 <201401211642.55461.marex@denx.de>
 <CAMuHMdVMDO9nKQPgNwz47H2mK6kKreNYiyn-AFOB2KryRpSgoA@mail.gmail.com>
In-Reply-To: <CAMuHMdVMDO9nKQPgNwz47H2mK6kKreNYiyn-AFOB2KryRpSgoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201401211710.53340.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-spi@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 Sourav Poddar <sourav.poddar@ti.com>,
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

On Tuesday, January 21, 2014 at 04:58:59 PM, Geert Uytterhoeven wrote:
> On Tue, Jan 21, 2014 at 4:42 PM, Marek Vasut <marex@denx.de> wrote:
> >> Spansion s25fl256s1 and s25fl512s support Dual SPI transfers, hence set
> >> the M25P80_DUAL_READ flag.
> > 
> > Why don't you lump this together with 1/4 ? :)
> 
> Because I don't want to delay Quad support for s25fl512s by bike-shedding
> about the need for Dual support.
> 
> Gr{oetje,eeting}s,

OK, gotcha. Either way is fine with me here.

Best regards,
Marek Vasut
