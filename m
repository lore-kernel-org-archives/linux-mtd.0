Received: from moutng.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ovnra-0005IQ-Vg
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2010 09:01:11 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/7] mtd: autoconvert trivial BKL users to private mutex
Date: Wed, 15 Sep 2010 11:01:01 +0200
References: <1284494022-7346-1-git-send-email-arnd@arndb.de>
	<1284494022-7346-3-git-send-email-arnd@arndb.de>
	<1284536526.25181.51.camel@localhost>
In-Reply-To: <1284536526.25181.51.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009151101.01989.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 15 September 2010, Artem Bityutskiy wrote:
> > Consequently, we can remove the BKL completely,
> > replacing it with a per-file mutex in every case.
> > Using a scripted approach means we can avoid
> > typos.
> > 
> 
> Looks good, are you going to merge them all yourself or you want this to
> go via the mtd tree?

Either way is fine for me. If it goes into the mtd tree, I'll drop
it from my series.

	Arnd
