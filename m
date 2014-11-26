Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtT7v-00028y-NV
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 03:18:48 +0000
Received: by mail-pd0-f180.google.com with SMTP id p10so1882774pdj.11
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 19:18:27 -0800 (PST)
Date: Tue, 25 Nov 2014 19:18:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
Message-ID: <20141126031823.GQ24364@ld-irv-0074>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
 <54626AF4.4090306@nod.at>
 <CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>
 <54626D23.1080003@nod.at>
 <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Richard Weinberger <richard@nod.at>, Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 06:16:29PM -0200, Fabio Estevam wrote:
> BTW, I don't see any other nand driver that prints error on the probe
> error path like this one.

You're probably still going to see failure prints like

  nand: No NAND device found

in nand_scan_ident(), right? Or does driver probe fail earlier than that
somehow?

In general, I don't think you can expect non-discoverable hardware types
not to complain at all when you falsely declare them as "present" in the
device tree.

If this is really the only thing being printed though, I can apply the
patch. It's not worth too much more discussion anyway, IMO.

(BTW, one thing you have going for you; you *do* print something when
you successfully probe. The absence of such a message in your log tells
you almost as much as the failure print you're trying to remove does.)

Brian
