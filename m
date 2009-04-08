Received: from mail.datacom-telematica.com.br ([200.213.13.18])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrbW2-0003EU-1p
	for linux-mtd@lists.infradead.org; Wed, 08 Apr 2009 17:24:52 +0000
Received: from [176.16.10.186] (unknown [176.16.10.186])
	by mail.datacom-telematica.com.br (Postfix) with ESMTP id D446D32AD8
	for <linux-mtd@lists.infradead.org>;
	Wed,  8 Apr 2009 13:55:09 -0300 (BRT)
Message-ID: <49DCD7C9.2050802@datacom-telematica.com.br>
Date: Wed, 08 Apr 2009 13:58:49 -0300
From: DATACOM - Nedel <nedel@datacom-telematica.com.br>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Volume write-protected
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've created a image with mkfs.ubifs and ubinize commands, as follow:

mkfs.ubifs -r ramdisk -m 2048 -c 8190 -e 126KiB -o image.temp
ubinize -o $(BUILT)/images/image.ubifs -m 2048 -p 128KiB -s 512 ubinize.cfg

ubinize.cfg content:
[ubifs]
mode=ubi
image=PD1200.temp
vol_id=0
vol_size=900MiB
vol_type=dynamic
vol_name=ubipart
vol_alignment=1
vol_flags=autoresize

After I flash the ubi image, with nand write u-boot command, I've tried 
to mount it:

# mount -t ubifs ubi0!ubipart /mnt/flash/
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
8188:512, written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
8191:512, written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
8190:512, written 0 bytes
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
8189:512, written 0 bytes
UBI error: ubi_io_write: read-only mode
UBI error: erase_worker: failed to erase PEB 8188, error -30
UBI error: do_work: work failed with error code -30
UBI error: ubi_thread: ubi_bgt0d: work failed with error code -30
UBIFS error (pid 6550): ubifs_write_node: cannot write 2048 bytes to LEB 
1:2048, error -30
mount: ubi0!ubipart is write-protected, mounting read-only

I can't find where this write-protected flag is set.
Sorry but when I try to run my kernel image with ubifs debug it hangs 
before u-boot initialization.

Thanks in advance,

-- 
Werner Maurício NEDEL
