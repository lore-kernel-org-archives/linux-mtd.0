Received: from mail.mystique-magazine.com ([205.238.173.42])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWP3e-0005Cl-IA
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 05:51:53 +0000
Message-ID: <498FC4BB.7060903@infinity-studios.com>
Date: Sun, 08 Feb 2009 23:52:59 -0600
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2: Too few erase blocks (1)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've allocated a small (64K) "user_config" partition in my flash for
persistence storage:

mtd0: 00020000 00010000 "u-boot"
mtd1: 00010000 00010000 "Config"
mtd2: 00100000 00010000 "vmlinux"
mtd3: 002a0000 00010000 "rootfs"
mtd4: 00010000 00010000 "user_config"
mtd5: 00020000 00010000 "ART"

When I tried to mount -t jffs2 /dev/mtdblock4, I get

jffs2: Too few erase blocks (1)

I understand that my erasesize is 64K, which gives me only 1 block,
and jffs2 needs more than 1 block, but the kernel defaults the erasesize
to 64K.

If I made a jffs2 file with eraseblock=8, would this work or would I have
to set it at the kernel?

Dzuy
