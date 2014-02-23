Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHOlQ-0000tD-Ap
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 02:25:57 +0000
Received: by mail-pb0-f54.google.com with SMTP id uo5so5046688pbc.13
 for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2014 18:25:34 -0800 (PST)
Date: Sat, 22 Feb 2014 18:25:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: m25p80: add support for the Spansion s25fl008k chip
Message-ID: <20140223022531.GC11836@norris-Latitude-E6410>
References: <1392108678-29099-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392108678-29099-1-git-send-email-geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sh@vger.kernel.org,
 Yusuke Goda <yusuke.goda.sx@renesas.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 11, 2014 at 09:51:18AM +0100, Geert Uytterhoeven wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@linux-m68k.org>
> ---
> "s25fl008k" is in active use since v3.11-rc1

Pushed to l2-mtd.git. Thanks!

Brian
