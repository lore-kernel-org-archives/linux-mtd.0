Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORVb2-0004KS-HF
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 19:26:54 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1ORVav-0008TR-2K
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 21:26:45 +0200
Received: from gate-ca119.motorola.com ([144.189.100.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jun 2010 21:26:45 +0200
Received: from dave+gmane by gate-ca119.motorola.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jun 2010 21:26:45 +0200
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave+gmane@wuertele.com>
Subject: Performance effect of mounting jffs2 via mtdblock
Date: Wed, 23 Jun 2010 19:26:33 +0000 (UTC)
Message-ID: <loom.20100623T212106-800@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reading http://www.linux-mtd.infradead.org/faq/jffs2.html, it says that jffs2
can be mounted with or without the mtdblock driver.  Eg:

  mount -t jffs2 mtd2 /foo 
vs
  mount -t jffs2 /dev/mtdblock2 /foo

I'm wondering what is the difference between these two methods with respect to
performance?

Thanks,
Dave
