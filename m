Received: from mail.newlogic.at ([194.208.88.201])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19zYIr-0002y0-Bh
	for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2003 10:08:49 +0100
Received: from enterprise2.newlogic.at (e2-1.newlogic.at [172.27.1.1])
	by mail.newlogic.at (8.12.9/8.12.9) with ESMTP id h8H97LYu017832
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2003 11:07:21 +0200 (MEST)
Received: from blade100-2 (blade100-2.newlogic.at [172.27.120.2])
	h8H97aZS025706	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Sep 2003 11:07:36 +0200 (MEST)
Message-Id: <200309170907.h8H97aZS025706@enterprise2.newlogic.at>
MIME-Version: 1.0
Date: Wed, 17 Sep 2003 11:07:36 +0200 (MEST)
Sender: nwaibel@newlogic.com
From: Niki Waibel <niki.waibel@newlogic.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: doc2000.c / docprobe.c
Reply-To: Niki Waibel <niki.waibel@newlogic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i do not understand how the doc2000.c and the docprobe.c code
fit together.

doc2000.c has this ``inter_module_register(im_name, THIS_MODULE, &DoC2k_init);''
function in its init code.

does the docprobe.c module do the actual initialisation?
i cannot see any probed addresses in doc2000.c -- so it
must be somewhere else!?

niki w. waibel
