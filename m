Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0uVt-0005bd-0M
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 18:39:39 +0000
Received: by mail-yb0-x244.google.com with SMTP id b2so1789689yba.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 11:39:13 -0700 (PDT)
Date: Wed, 19 Apr 2017 11:39:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: use dev_of_node helper in mtd_get_of_node
Message-ID: <20170419183910.GB20555@google.com>
References: <20170331091148.19816-1-zajec5@gmail.com>
 <20170331114950.726c9cb7@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170331114950.726c9cb7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 31, 2017 at 11:49:50AM +0200, Boris Brezillon wrote:
> On Fri, 31 Mar 2017 11:11:48 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > This allows better compile-time optimizations with CONFIG_OF disabled.
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Not sure we care about such micro-optimizations, but it shouldn't hurst
> so,
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied
