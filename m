Received: from pyxis.i-cable.com ([203.83.110.34])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BWST4-0006F3-9L
	for linux-mtd@lists.infradead.org; Sat, 05 Jun 2004 00:07:41 -0400
Message-ID: <00e501c44ab2$d124cae0$b30efeda@gbman>
From: "Simon Chow Kin Wah" <vbman@gbman.com>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 5 Jun 2004 12:08:52 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Create Partition Problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi! I need some guide on creating partition in my flash Intel E28F128.
I want to partition like below:
1M bootlader
2M zImage
4M ramfs
9M jffs2

But still I don't know how to do partition. Is that I have to modify the
kernel code? I want to create the devices like /dev/mtdblock/0.

Can you guide me please?
