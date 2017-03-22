Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqnNK-0004da-Mf
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 21:01:01 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 8CAA9433A7
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 22:00:30 +0100 (CET)
Subject: Re: [PATCH v4 0/2] mtd: spi-nor: Add possibility to disable chip erase
To: Marcin Krzeminski <mar.krzeminski@gmail.com>, cyrille.pitchen@atmel.com,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org
References: <20170106171901.27565-1-mar.krzeminski@gmail.com>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <2c733c67-836e-03f9-93cd-19966e2e3685@wedev4u.fr>
Date: Wed, 22 Mar 2017 22:00:22 +0100
MIME-Version: 1.0
In-Reply-To: <20170106171901.27565-1-mar.krzeminski@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 06/01/2017 à 18:18, Marcin Krzeminski a écrit :
> v4:
> * Rebased to git://github.com/spi-nor/linux.git next branch.
> * Typos corrected.
> v3:
> * Fix/reword commit messages.
> v2:
> * Rebased to git://github.com/spi-nor/linux.git
> 
> Marcin Krzeminski (2):
>   mtd: spi-nor: Fix whole chip erasing for stacked chips.
>   mtd: spi-nor: Disable chip erase for Micron n25q00.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
series applied to github/spi-nor

Thanks!
