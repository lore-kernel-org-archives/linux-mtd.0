Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LgnS6-0008Sc-UW
	for linux-mtd@lists.infradead.org; Mon, 09 Mar 2009 21:56:07 +0000
Received: by yx-out-1718.google.com with SMTP id 3so816987yxi.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Mar 2009 14:56:00 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 9 Mar 2009 17:56:00 -0400
Message-ID: <25dd9bf10903091456v2a2d60e6x1759351476fe6536@mail.gmail.com>
Subject: UBIFS mounting error
From: Subramani Venkatesh <subbu31mani@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I am trying to mount UBIFS on NAND flash, I am quite often getting the
error below after rebooting.

UBIFS: recovery needed
UBI error: ubi_io_write: error -5 while writing 2048 bytes to PEB
0:4096, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write 2048 bytes at offset 0
of LEB 0:4, PEB 0
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
1:2048, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 1
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
2:2048, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 2
UBI: try another PEB
UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB
11:2048, written 0 bytes
UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:4, PEB 11
UBI warning: ubi_ro_mode: switch to read-only mode

I created UBIFS image for 400MiB volume

./mkfs.ubifs -r target -m 2KiB -e 124KiB -c 3164 -o ti-ubifs.img
./ubinize -o ti-flash.img -m 2048 -p 128KiB -s 2048 ubinize-ti.cfg

and the config file is

[ubifs]
mode=ubi
image=ti-ubifs.img
vol_id=0
vol_size=392448KiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize

I am getting above error only after rebooting.

I have software ecc for 512 bytes.
Though I have 512 bytes of sub-page, I forced it to 2048 Bytes,
considering no sub-page.

Can anyone guide why I am getting above error after rebooting for
autoresize and dynamic volume.

Thanks,
Subbu
