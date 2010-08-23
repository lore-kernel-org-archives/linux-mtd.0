Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnUC9-0008GR-QF
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 10:24:02 +0000
Received: by iwn41 with SMTP id 41so6227392iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 03:23:59 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 23 Aug 2010 12:23:58 +0200
Message-ID: <AANLkTikgBKD4yku0fF_WaatNaOsRWwPf-VLKrWXByk1a@mail.gmail.com>
Subject: MTD Flash Partition: change possible?
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In my embedded system the Flash-partition table is compiled into kernel.
Is there a way to change partition table without booting a new kernel? How?

Background: I want to update an embedded system and change the size of
partitions. But tools as flash_eraseall and nandwrite use partitions
of the current kernel. If I want to change the size of the partitions,
this is impossible.
If I first flash a new kernel with new partition table, I have to
reboot and the system will not start, as the old partitioning scheme
is still active.
