Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6Ndi-0005ZP-4x
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 10:33:14 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K6Ndg-0005Iz-05
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 10:33:12 +0000
Received: from vpn128.rz.tu-ilmenau.de ([141.24.172.128])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 10:33:11 +0000
Received: from andre.puschmann by vpn128.rz.tu-ilmenau.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2008 10:33:11 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
Date: Wed, 11 Jun 2008 12:33:02 +0200
Message-ID: <g2o9kv$sbs$1@ger.gmane.org>
References: <g2o39t$703$1@ger.gmane.org>
	<484F92E5.2080207@cetrtapot.si>	<g2o5oo$fqe$1@ger.gmane.org>
	<484FA122.1030208@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <484FA122.1030208@cetrtapot.si>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Hinko Kocevar wrote:
> Is this true (kernel config)?:
> CONFIG_JFFS2_FS=y
> CONFIG_MTD_BLKDEVS=y
> CONFIG_MTD_BLOCK=y

Sure, all these parameters are defined. Also, mdev dynamically creates
the device nodes.


Regards,
	Andre
