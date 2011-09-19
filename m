Received: from relay4.ptmail.sapo.pt ([212.55.154.24] helo=sapo.pt)
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5eGv-0004Dk-7k
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 13:52:35 +0000
Message-ID: <20110919145214.19341ml5c346kgzy@mail.sapo.pt>
Date: Mon, 19 Sep 2011 14:52:14 +0100
From: dhlm83@sapo.pt
To: linux-mtd@lists.infradead.org
Subject: flash_erase ERROR!
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; DelSp="Yes"; format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.
This is my first post.

I am using uClinux (kernel 2.4.34.5-uc0 , dist: 20110603)
I build a image to board NetBurner MOD5272.

I have de following flash memory map:
      ......
      Creating 6 MTD partitions on "Physically mapped flash Netburner MOD527=
2":
      0x00000000-0x00004000 : "boot monitor (16K)"
      0x00004000-0x00006000 : "monitor params (8K)"
      0x00006000-0x00008000 : "user params (8K)"
      0x00008000-0x00010000 : "application code 1 (32K)"
      0x00010000-0x001a0000 : "application code 2 (1600K)"
      0x001a0000-0x00200000 : "flash fs (384K)"
      ......

As can be seen, I have one partition with 384k (6 sectors of 64kiB) in =20
/dev/mtd5 with corresponding block device /dev/mtdblock4
That partition is mounted in /mnt directory in jffs2 type, and used to =20
save some configuration files.
      ......
      #!/bin/sh
      echo "Mounting /mnt (jffs2)"
      mount -t jffs2 /dev/mtdblock5 /mnt
      ......

For some unknown reason the file system come corrupted, afther some =20
system reboot.
And afther this, always it try mount  /mnt get many:
      jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at =20
0xXXXXXXXX: 0xXXXX instead


I read in this link =20
(http://forums.freescale.com/t5/Other-Microcontrollers/JFFS2-complaining-jff=
s2-scan-eraseblock-Magic-bitmask-0x1985-not/td-p/40002), to solve this i hav=
e to format the =20
partition.
The problem is: The flash_eraseall and flash_erase dont work.
      ......
      # flash_eraseall -j /dev/mtd5 0 0
      /bin/flash_eraseall has been replaced by `flash_erase <mtddev> 0 =20
0`; please use it
      Access Error Exception 12: Error on data read
      SIGSEGV
      ......

      ......
      # flash_erase -j -u -N /dev/mtd5 0 0
      libmtd: error!: MEMGETBADBLOCK ioctl failed
              error 25 (Inappropriate ioctl for device)
      flash_erase: error!: mtd_get_dev_info failed
      .....

Has anyone had this problem?
Someone may give clues to solve the problem?

Thanks.
Domingos Goncalves.
