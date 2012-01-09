Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkMS3-0006Dz-Vt
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 21:08:20 +0000
Received: by eekc13 with SMTP id c13so2801977eek.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 13:08:18 -0800 (PST)
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 09 Jan 2012 23:08:16 +0200
In-Reply-To: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326143297.4463.5.camel@koala>
Mime-Version: 1.0
Cc: robert.jarzmik@free.fr, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-03 at 16:05 -0800, Mike Dunn wrote:
> This patch adds a driver for the M-Sys / Sandisk diskonchip G4 nand flash found
> in various smartphones and PDAs, among them the Palm Treo680, HTC Prophet and
> Wizard, Toshiba Portege G900, Asus P526, and O2 XDA Zinc.  It was tested on the
> Treo 680, but should work generically.
> 
> Since v3, this patch adds power management functions, a scan of the factory bad
> block table during initialization, several fixes, and more extensive testing.
> Also, the platform data header file, which only contained partitioning
> information, was removed.  Command-line partitioning can be used, at least until
> an mtd parser is written for the saftl format with which these chips are
> shipped.
> 
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Hopefully this gets some review, Reobert, may be? You have been in the
same boat lately (delays because of lack of review).

This is 3.4 material anyway, so I am waiting when 3.3 merge window
closes - then I will be able to take this to the l2 tree.

Thanks!

Artem.
