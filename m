Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6mXM-0006eg-A6
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 13:08:20 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K6mXH-0002fw-34
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 13:08:15 +0000
Received: from vpn1.rz.tu-ilmenau.de ([141.24.172.1])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2008 13:08:15 +0000
Received: from andre.puschmann by vpn1.rz.tu-ilmenau.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2008 13:08:15 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
Date: Thu, 12 Jun 2008 15:08:01 +0200
Message-ID: <g2r73j$g89$1@ger.gmane.org>
References: <g2o39t$703$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
In-Reply-To: <g2o39t$703$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I found out that the problem came from a bug in busybox' mdev.
Patch is available that fixes the problem for kernel 2.6.25 and later.
So it's no mtd problem. Sorry for waisting the list ;-)


Thanks and best regards,
	Andre
