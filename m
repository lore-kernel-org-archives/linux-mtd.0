Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsEF9-0000uk-Cb
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 10:13:39 +0000
Message-ID: <48FDAB4F.7000102@parrot.com>
Date: Tue, 21 Oct 2008 12:13:35 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH] S3C24xx NAND: Correct tacls_max for S3C2410
References: <20081020090947.GZ1048@prithivi.gnumonks.org>
In-Reply-To: <20081020090947.GZ1048@prithivi.gnumonks.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Ben Dooks <ben@trinity.fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Harald Welte a écrit :
> At least according to my S3C2410X manual, the maximum tacls setting
> for the 2410 is 8, not 4.  S3C2410 is therefore like the S3C2412 (and 2443),
> not like 2440 and 2442.
> 
Funny a similar patch has been posted more than 1 year ago :
http://thread.gmane.org/gmane.linux.drivers.mtd/17363

But like other patches from different people (some are really bug fix),
there were never merged...


Matthieu
