Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6L6W-0008V9-6q
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 16:59:21 +0000
Received: by mail-pa0-x243.google.com with SMTP id gp3so6338859pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 09:58:58 -0700 (PDT)
Date: Fri, 27 May 2016 09:58:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>, David Woodhouse <dwmw2@infradead.org>,
 devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Documentation: dt: mtd: drop "soft_bch" from example
Message-ID: <20160527165854.GD89390@google.com>
References: <a206ce4cabf9ba8d376241fc23e9973f6db2443b.1464147910.git.baruch@tkos.co.il>
 <20160527153153.420c86e7@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160527153153.420c86e7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 27, 2016 at 03:31:53PM +0200, Boris Brezillon wrote:
> On Wed, 25 May 2016 06:45:10 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
> > Commit 32698aafc9f0 (Documentation: devicetree: deprecate "soft_bch"
> > nand-ecc-mode value, 2016-04-22) deprecated "soft_bch". Update the example to
> > match.
> > 
> > Cc: Rafał Miłecki <zajec5@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I don't know if we should consider this as a bugfix. If that's the
> case, can you take it directly in your tree with my

Well, I don't know if it's a "bugfix" per se, but it's obviously correct
and has approx 0 risk.

> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Wow, thanks! Three acks! Y'all must really love documentation :)

Pushed to linux-mtd.git.

Brian
