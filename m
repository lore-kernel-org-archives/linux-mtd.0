Received: from albatros.havelsan.com.tr ([195.142.233.60])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17quij-00086n-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 13:11:18 +0100
Message-ID: <001c01c25d79$fc271180$3064000a@nurpinar>
From: "nur" <nurpinar@e-kolay.net>
To: "MTD" <linux-mtd@lists.infradead.org>
Subject: diskonchip millenium, will it ever work?
Date: Mon, 16 Sep 2002 15:10:01 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

After partitioning by fdisk, my DoC become inaccessible
I mean i get the messsage "No recognized diskonchip found" error at every
boot process
This happened ~3 months before and I havent' found any solution yet! I hope
somebody has a solved the same problem before.
I compiled kernel 2.4.18. I know DoC is at 0xe8000 address
My other DoCs are working very well..
I can't change window address from bios. It is fixed.
What would you recommend me to do
Enabling/disabling "probe for 0x55 0xAA Extension Signature" didn't change
the result
Thanks

Nur.
