Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C86PI-0008Ur-Ip
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 20:15:21 -0400
Received: from thomas.tec.linutronix.de (pD95F6EE6.dip.t-dialin.net
	[217.95.110.230]) (using SSLv3 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by debian.tglx.de (Postfix) with ESMTP id 1148A65C035
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Sep 2004 02:12:42 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1095379673.28388.206.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Fri, 17 Sep 2004 02:07:53 +0200
Content-Transfer-Encoding: 7bit
Subject: 2.6 Update
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The __iomem related changes in 2.6 concerning readb, writeb and friends
made it neccecary to overhaul the MTD code to get rid of about 1000
warnings.

I committed the neccecary semantical fixes (works unfortunately on 2.4
too). 

Please check the functionality of your drivers in order to prepare an
upstream push

tglx
