Received: from [63.144.37.162] (helo=mh02.bioace.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rkIq-00041p-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 20:16:00 +0100
Received: from bioace.net (unknown [192.168.10.179])
	by mh02.bioace.net (Postfix) with ESMTP id 7EF3F40230
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 14:57:58 -0400 (EDT)
Message-ID: <3D88CCB6.7C2C3BC4@bioace.net>
Date: Wed, 18 Sep 2002 14:57:58 -0400
From: Carl Przybylek <carlp@bioace.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS1/2 with DiskOnChip
Content-Type: text/plain; charset=us-ascii
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

I keep getting these ECC needs a full sector write when trying to put a
jffs1/2 image onto an m-sys disk on chip.   Seems at first the latest
mtd source did not link into the kernel correctly, Ive fixed that and I
still keep getting the errors.  If someone can answer the following
questions or add some insight that would be great.

Ive went through and ensured the following are configured in the kernel
