Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OchGR-0001dv-8e
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 16:07:51 +0000
Received: by eyd10 with SMTP id 10so286697eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 24 Jul 2010 09:07:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 24 Jul 2010 19:07:28 +0300
Message-ID: <AANLkTi=Aw=yFCsz4PArNoMVOpOU567ffzUHooVvXKQtF@mail.gmail.com>
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module ref-counting
	back to open/release
To: Ben Hutchings <bhutchings@solarflare.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is done on purpose.

Otherwise, as soon as someone registers mtd translation layer with partitions,
the add_gendisk will scan partitions and thus call blktrans_open()
and mtd_table_mutex is already held.

Here I can unload both mtd and blktrans driver after mtd driver
removes mtd device (that happens when I remove the xD card)
While card is inserted its indeed not possible to remove nether mtd
nor translation layer driver.
