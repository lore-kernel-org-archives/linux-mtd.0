Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rM28-0002SV-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 17:16:36 +0100
Received: from lxserver.deltes.cz (IDENT:martin@lxserver.deltes.cz [192.168.5.5])
	by mail.deltaes.com (8.9.3/8.9.3) with ESMTP id QAA27294
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 16:34:59 +0200
Date: Wed, 10 Oct 2001 18:31:29 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: linux-mtd@lists.infradead.org
Subject: Eraseblock size in jffs2 ?
Message-ID: <Pine.LNX.4.21.0110101821350.18912-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi

I have any questions.

1. How can I set eraseblock size for mkfs.jffs2 ?

I have DoC 24MB and line in /proc/mtd is:
dev:    size   erasesize  name
mtd0: 01800000 00002000 "DiskOnChip 2000"

2. Must I use erase command when I create jffs2 on the DoC ?
   Or better: Can I use next command line only for create jffs2 on
   the DoC ?
   # mkfs.jffs2 -e XXXXXX -d directory >/dev/nftla1

Thanks

Martin
