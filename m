Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dViLx-0008NP-2M
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 17:56:43 +0000
Received: by mail-pg0-x243.google.com with SMTP id u62so7728322pgb.0
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jul 2017 10:56:23 -0700 (PDT)
Date: Thu, 13 Jul 2017 10:56:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] Documentation: ABI: mtd: describe "offset" more precisely
Message-ID: <20170713175620.GK55942@google.com>
References: <20170625111154.14022-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170625111154.14022-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 25, 2017 at 01:11:54PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> So far Linux supported only two levels of MTD devices so we didn't need
> a very precise description for this sysfs file. With commit
> 97519dc52b44a ("mtd: partitions: add support for subpartitions") there
> is support for a tree structure so we should have more precise
> description. Using "parent" and "flash device" makes it more accurate.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied to linux-mtd.git
