Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LMLZj-00033M-1x
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 12:07:23 +0000
Date: Mon, 12 Jan 2009 12:57:41 +0100
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: dwmw2@infradead.org
Subject: [BUG] 2.6.29-rc1: /proc/mtd partition names obfuscated
Message-ID: <20090112115741.GA23365@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i'm running 2.6.29-rc1 on a edb9302 (ARM) board. the partitioning of
the flash is passed as usual as parameter:

cat /proc/cmdline
console=ttyAM0,115200
mtdparts=physmap-flash.0:256k(u-boot),128k(cfg_boot),128k(cfg_boot.bak),1664k(kernel_1),6144k(rootfs_1),1664k(kernel_2),6144k(rootfs_2),128k(cfg_app),128k(cfg_app.bak)


dmesg shows that the command line is interpreted correctly:

9 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 9 MTD partitions on "physmap-flash.0":
0x000000000000-0x000000040000 : "u-boot"
0x000000040000-0x000000060000 : "cfg_boot"
0x000000060000-0x000000080000 : "cfg_boot.bak"
0x000000080000-0x000000220000 : "kernel_1"
0x000000220000-0x000000820000 : "rootfs_1"
0x000000820000-0x0000009c0000 : "kernel_2"
0x0000009c0000-0x000000fc0000 : "rootfs_2"
0x000000fc0000-0x000000fe0000 : "cfg_app"
0x000000fe0000-0x000001000000 : "cfg_app.bak"


but when looking at /proc/mtd, the partition names are somehow, 'obfuscated':

 cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00020000 ""
mtd1: 00020000 00020000 ""
mtd2: 00020000 00020000 ""
mtd3: 001a0000 00020000 "�"
mtd4: 00600000 00020000 ""
mtd5: 001a0000 00020000 ""
mtd6: 00600000 00020000 ""
mtd7: 00020000 00020000 ""
mtd8: 00020000 00020000 "s"

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

               For to be free is not merely to cast off
               one's chains, but to live in a way that
              respects and enhances the freedom of others
                           (Nelson Mandela)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
