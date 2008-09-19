Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kgi2j-0002Nu-7J
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 15:37:13 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kgi2f-0004NS-Dw
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 15:37:09 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2008 15:37:09 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2008 15:37:09 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: Problem with Hynix HY27UF081G2A 1Gb NAND flash?
Date: Fri, 19 Sep 2008 17:28:04 +0200
Message-ID: <lyhc8ccfzv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <Pine.LNX.4.64.0809191409210.29177@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof <ricard.wanderlof@axis.com> writes:

> I'm testing the above mentioned NAND flash chip in a design
> which has previously used the corresponding 1Gb parts from
> Samsung and Numonyx (ST) without problems. However, with the
> Hynix chip, mtd won't even read the ID code, it's just as if
> the chip wasn't there (it fails with

Some Hynix NAND chips seem to have problems with bus arbitration;
e.g. they continue to shift out data when chipselect is
deasserted during a operation (e.g. because ethernet controller
was accessed in this time).  We saw this with HY27UG088G5M on
PXA320 and read-page operations.


Enrico
