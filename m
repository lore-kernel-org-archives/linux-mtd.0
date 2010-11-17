Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PIrfi-0006r3-AO
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2010 23:44:15 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Are there UBI layout changes between 2.6.35 and 2.6.36?
Date: Thu, 18 Nov 2010 12:44:04 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201011181244.04745.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Folk

I have been helping some people get an omap3 overo-based system going. 
Everything is working fine using 2.6.35 and software ECC, but when I changed 
I change to 2.6.36 and hwecc things stop working. I get the following 
problem, and obviously no boot :-(.

UBI: attaching mtd7 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: corrupted PEBs will be formatted
UBI: max. sequence number:       0
UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
UBI error: vtbl_check: bad CRC at record 0: 0xc4ef3d92, not 0x639e7026
UBI error: process_lvol: both volume tables are corrupted
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
UBI error: ubi_init: cannot attach mtd7

I don't think this is just a straight forward software/hardware ECC issue I 
don't get the ECC error reports I would get if I load the NAND using software 
ECC.

OK, the background...

The roofts is created by mkfs.ubifs, then ubinized, then programmed via u-boot 
using hw or sw ecc as appropriate.

The following are used to create the image:

ubinize.cmd is
[rootfs-volume]
mode=ubi
image=ubifs.tmp
vol_name=root
vol_size=20MiB
vol_id=0
EOF

mkfs.ubifs  -m 2048 -e 126KiB -c 1000 -r .  $tmp_dir/ubifs.tmp	
ubinize -o $out_file -p 128KiB -s 512 -m 2048 ubinize.cmd

Has something changed between 2.6.35 and 2.6.36 that will mess up the way the 
volumes are managed?

Thanks

Charles
