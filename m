Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYPZ-0002oa-6C
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:20:52 +0000
Subject: about ubifs
From: tommy <jiujin.hong@mid-fun.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Fri, 05 Jun 2009 20:13:55 +0800
Message-Id: <1244204035.18630.0.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,i have found a question about ubifs and sync !

Question is following;

Artem,
What i do is just open an existing file in a UBIFS formated UBI volume
on a Nand Flash,

add a few lines to it ,close the file ,then without unmounting the
filesystem and reboot the filesystem.

When my board reboots and i looked at that file ,it's zero length and
has no contents.I suspect it's because

UBIFS does less frequent syncs .it just lost content of the file because
there's no sync before the reboot!

How can i solve this ?
