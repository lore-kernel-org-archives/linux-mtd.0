Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f05X-0004qT-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 15:25:03 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B35@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Thu, 6 Sep 2001 16:29:54 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Does the size of the output from mkcramfs exceed the size of 
> the partition 
> the kernel thinks it's in?

No, mkcramfs says: "Everything: 984 kilobytes"

And the image created is 1007616 bytes (984 * 1024).

/Jonas
