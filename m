Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeZ4q-0003jU-Sm
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 21:56:42 +0000
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jun 2012 23:56:35 +0200
From: Richard Weinberger <richard@nod.at>
To: <dedekind1@gmail.com>
Subject: UBIFS: unlink failure
Message-ID: <332997dc8907401d45f417c18fd2aace@radon2.swed.at>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

While testing UBI fastmap I encountered a problem.
After multiple writes unlink fails.

This is my test case:
---cut---
function do_mount_write1()
{
        ubiattach -m 0 /dev/ubi_ctrl
        mount /dev/ubi0_0 /mnt/ -t ubifs
        dd if=/dev/urandom of=/mnt/x bs=1M count=1
        dd if=/dev/urandom of=/mnt/x bs=1M count=2
        dd if=/dev/urandom of=/mnt/x bs=1M count=10
        dd if=/dev/urandom of=/mnt/x bs=1M count=30
        rm x
        umount /mnt
        ubidetach -m 0 /dev/ubi_ctrl
}

flash_eraseall /dev/mtd0

ubiattach -m 0 /dev/ubi_ctrl
ubimkvol -N test -s 100MiB /dev/ubi0
mkfs.ubifs /dev/ubi0_0
ubidetach -m 0 /dev/ubi_ctrl

do_mount_write1
---cut---

rm does newfstatat() and unlinkat(), both fail with ENOENT.
The issue is 100% reproducible on a current kernel (3.4)
Adding a "sleep 10" before the rm does _not_ help.

Thanks,
//richard
