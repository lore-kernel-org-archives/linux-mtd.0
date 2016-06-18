Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEKqO-0004nw-DQ
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 18:19:45 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: viro@zeniv.linux.org.uk, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: ubifs: regression: unable to mount ubifs
Message-ID: <7158a3b3-5dee-48a0-339a-d8bcdb5b8805@hauke-m.de>
Date: Sat, 18 Jun 2016 20:19:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The commit 322ea0bb "mtd: switch ubi_open_volume_path() to vfs_stat()"
breaks mounting ubifs volumes for me.

On kernel 4.7-rc3 I am getting the following error when trying to mount
an ubifs volume. This volume in on a ubi file system which exports it as
a mtd partition.

root@lede:/# mkdir /tmp/test
root@lede:/# mount -t ubifs /dev/ubi0_10 /tmp/test/
[  178.782184] UBIFS error (pid: 955): cannot open "/dev/ubi0_10", error
-22mount: mounting /dev/ubi0_10 on /tmp/test/ failed: Invalid argument
root@lede:/#

In the function ubi_open_volume_path() the call to vfs_stat() returns
-EFAULT.

After I reverted commit 322ea0bb it works again.

Hauke
