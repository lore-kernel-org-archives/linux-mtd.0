Received: from nm1-vm0.bullet.mail.ukl.yahoo.com ([217.146.183.224])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S1yas-0001iM-KP
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2012 11:18:15 +0000
Message-ID: <4F4B6673.7030509@yahoo.fr>
Date: Mon, 27 Feb 2012 12:18:11 +0100
From: Patrick <kpa_info@yahoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Error when mounting ubi image
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear mailing-list,

I am still facing some trouble with UBI and UBIFS. I am working on an 
OMAP4 processor with a 3.0.21 kernel and a Micron MT29F4G08ABBDAH4 1GB 
NAND Flash.

I generate the ubi image of my rootfs using the following command:

   mkfs.ubifs -r my_rootfs -o my_image.ubifs -m 2048 -e 129024 -c 4060
   ubinize -o my_rootfs.ubi -m 2048 -p 128KiB -s 512 ubinize.cfg

And the following ubinize.cfg file:

   [ubifs]
   mode=ubi
   image=my_image.ubifs
   vol_id=0
   vol_type=static
   vol_name=my_rootfs

Then I flash this image and mount it with the following commands:

   ubiformat /dev/mtd4 -f my_rootfs.ubi
   ubiattach -p /dev/mtd4
   mount -t ubifs ubi0_0 /media/test/

I then have the following error:

   mount: block device ubi0_0 is write-protected, mounting read-only

And from the kernel (dmesg):

UBI warning: ubi_eba_read_leb: CRC error: calculated 0x34afeca5, must be 
0x74215933
UBI warning: ubi_open_volume: volume 0 on UBI device 0 is corrupted
UBIFS warning (pid 226): init_constants_early: UBI volume is corrupted - 
read-only mode
UBIFS: static UBI volume - read-only mode
UBIFS error (pid 226): mount_ubifs: cannot mount read-write - read-only 
media
UBIFS warning (pid 226): init_constants_early: UBI volume is corrupted - 
read-only mode
UBIFS: static UBI volume - read-only mode
UBIFS: mounted UBI device 0, volume 0, name "my_rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   42190848 bytes (41202 KiB, 40 MiB, 327 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)

I couldn't find what I am doing wrong. Any help will be really appreciated !

Thanks in advance

Patrick
