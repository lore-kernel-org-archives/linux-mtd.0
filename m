Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1KYh-0007tv-SE
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 22:28:17 +0000
Received: by mail-io0-x244.google.com with SMTP id h41so21677284ioi.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 15:27:54 -0700 (PDT)
Date: Thu, 20 Apr 2017 15:27:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: physmap_of: use OF helpers for reading strings
Message-ID: <20170420222750.GH20555@google.com>
References: <20170330155853.30349-1-zajec5@gmail.com>
 <20170331100239.37a14f37@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170331100239.37a14f37@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 31, 2017 at 10:02:39AM +0200, Boris Brezillon wrote:
> On Thu, 30 Mar 2017 17:58:53 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > OF core code provides helpers for counting strings and reading them so
> > use them instead of doing this manually. This simplifies the code a bit.
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied as a cleanup, while we figure out the future of this binding.
With luck we can deprecate it (but not remove it, of course) and use
something better in the generic code.
