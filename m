Received: from web58905.mail.re1.yahoo.com ([66.196.100.234])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAuA4-0001EV-7K
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 22:37:36 +0000
Date: Thu, 11 Dec 2008 14:37:34 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: UBIFS:  HELP --- cannot figure out correct linux bootlin
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <725079.80117.qm@web58905.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Found the problem: 

Can we add a note to the UBI and UBIFS FAQ and Howto:  ?

Note:  UBI and UBIFS must not be modules if you are using UBIFS for the linux rootfs

Philip



      
