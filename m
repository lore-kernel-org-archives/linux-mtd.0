Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJJE2-0003CG-L5
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 09:59:55 +0000
From: Sheng Yong <shengyong1@huawei.com>
To: <dedekind1@gmail.com>, <richard@nod.at>
Subject: [RFC PATCH] ubifs do not write master node if recovery needed
Date: Thu, 5 Feb 2015 09:54:39 +0000
Message-ID: <1423130080-79705-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
If unclean umount happens, mount ubifs may fail. At the meantime, the
master node on the flash remains dirty. But according to the current
mount procedure, a new master node will be written to the flash if we
try to mount the corrupted fs, no matter whether the recovery succeeds
or fails.

We may hope that the filesystem is not modified if the recovery fails.
However, useless master nodes keep on writing to the flash if we trying
to mount the fs serval times, like the following:

=================================
root@arm:/tmp# ./ubidump /dev/ubi0_0 -l 1 | tail -n 40
	magic          0x6101831
	crc            0x43493d53
	node_type      7 (master node)
	group_type     0 (no node group)
	sqnum          4306
	... ...
look at LEB 1:25088 (101888 bytes left)
scanning padding node at LEB 1:25088
1508 bytes padded at LEB 1:25088, offset now 26624
look at LEB 1:26624 (100352 bytes left)
hit empty space at LEB 1:26624
stop scanning LEB 1 at offset 126976
root@arm:/tmp# mount -t ubifs /dev/ubi0_0 /mnt/
[  291.923753] UBIFS error (pid 1631): ubifs_scan: garbage
[  291.999153] UBIFS error (pid 1631): ubifs_recover_leb: corruption 0
[  292.074298] UBIFS error (pid 1631): ubifs_scanned_corruption: corruption at LEB 5:4096
[  292.169248] UBIFS error (pid 1631): ubifs_scanned_corruption: first 8192 bytes from LEB 5:4096
[  292.170456] UBIFS error (pid 1631): ubifs_recover_leb: LEB 5 scanning failed
mount: mount /dev/ubi0_0 on /mnt failed: Structure needs cleaning
root@arm:/tmp# ./ubidump /dev/ubi0_0 -l 1 | tail -n 40
	magic          0x6101831
	crc            0x4f79c84e
	node_type      7 (master node)
	group_type     0 (no node group)
	sqnum          4307
	... ...
look at LEB 1:27136 (99840 bytes left)
scanning padding node at LEB 1:27136
1508 bytes padded at LEB 1:27136, offset now 28672
look at LEB 1:28672 (98304 bytes left)
hit empty space at LEB 1:28672
stop scanning LEB 1 at offset 126976
root@arm:/tmp# mount -t ubifs /dev/ubi0_0 /mnt/
[  302.376748] UBIFS error (pid 1642): ubifs_scan: garbage
[  302.452169] UBIFS error (pid 1642): ubifs_recover_leb: corruption 0
[  302.527334] UBIFS error (pid 1642): ubifs_scanned_corruption: corruption at LEB 5:4096
[  302.622285] UBIFS error (pid 1642): ubifs_scanned_corruption: first 8192 bytes from LEB 5:4096
[  302.623509] UBIFS error (pid 1642): ubifs_recover_leb: LEB 5 scanning failed
mount: mount /dev/ubi0_0 on /mnt failed: Structure needs cleaning
root@arma15el:/tmp/recovery# ./ubidump /dev/ubi0_0 -l 1 | tail -n 40
	magic          0x6101831
	crc            0x6beb031d
	node_type      7 (master node)
	group_type     0 (no node group)
	sqnum          4308
	... ...
look at LEB 1:29184 (97792 bytes left)
scanning padding node at LEB 1:29184
1508 bytes padded at LEB 1:29184, offset now 30720
look at LEB 1:30720 (96256 bytes left)
hit empty space at LEB 1:30720
stop scanning LEB 1 at offset 126976
=================================

This does not make any sense for both replay and reovery. And the
increasing sqnum makes it difficult to find out the last commit
checkpoint, as a result, we may unable to roll the fs back to last
commit state if we try to recover it.

If the recovery succeed, the master node could get updated when doing
commit next time. For normal mount, the check has no effect.

Sheng Yong (1):
  ubifs: do not write master node if recovery needed

 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.4
