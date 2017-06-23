Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOSib-0007GK-LI
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 17:50:07 +0000
Received: by mail-pf0-x22d.google.com with SMTP id c73so26549486pfk.2
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 10:49:45 -0700 (PDT)
Date: Fri, 23 Jun 2017 10:49:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: parsers: trx: fix pr_err format for printing offset
Message-ID: <20170623174941.GH14148@google.com>
References: <20170623050714.18134-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170623050714.18134-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 23, 2017 at 07:07:14AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes following warning:
> include/linux/kern_levels.h:4:18: warning: format '%X' expects argument of type 'unsigned int', but argument 2 has type 'size_t {aka long unsigned int}' [-Wformat=]
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied to l2-mtd.git
