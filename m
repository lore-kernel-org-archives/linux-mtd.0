Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO9Jg-0002n8-QX
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 21:07:06 +0000
Received: by mail-pg0-x232.google.com with SMTP id f127so12751749pgc.0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2017 14:06:44 -0700 (PDT)
Date: Thu, 22 Jun 2017 14:06:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V7 0/6] mtd: add support for subpartitions
Message-ID: <20170622210641.GE14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170621062647.6072-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 21, 2017 at 08:26:41AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This patchset adds support for subpartitions. This feature means support
> for partitions that are containers with extra subpartitions / volumes.
> 
> V7 splits the first patch into two separated ones (see 1/6 and 2/6). It
> also rebases 3/6 on top of l2-mtd.git and its recent changes.
> 
> I hope this is acceptable & clean & clear enough.
> 
> Please let me know if you think further improvements should be added.

Applied the series to l2-mtd.git. There's still an open question about
the "offset" sysfs file, but I don't think it's a blocker for merging.
(We should figure it out before this makes into a release though.)

Thanks,
Brian
