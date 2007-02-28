Received: from wr-out-0506.google.com ([64.233.184.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMJbs-0004Mz-RC
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 02:52:27 -0500
Received: by wr-out-0506.google.com with SMTP id i20so90064wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Feb 2007 23:52:23 -0800 (PST)
Message-ID: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
Date: Wed, 28 Feb 2007 09:52:21 +0200
From: "doodiexx doodiexx" <doodiexx@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NAND flash mounting problem
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are using Atmel's AT32AP7000 processor and ST 512Mbit NAND Flash
and having problems in creating a JFFS2 fs.

The mtd system detects the flash and I think everything is fine with
the kernel startup:

NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (ST Micro NAND 64MiB
3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 2995 at 0x02ecc000
Bad eraseblock 4078 at 0x03fb8000
Creating 1 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x04000000 : "rootfs"

I try to flash_eraseall -j and it completes without any error, but
when I try to mount it I get :
# mount /dev/mtd1 /mnt/nand
mount: mounting /dev/mtd1 on /mnt/nand failed

nanddump gives:

# ./nanddump -l 512 -p /dev/mtd1
Block size 16384, page size 512, OOB size 16
Dumping data starting at 0x00000000 and ending at 0x00000200...
0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
<skipping.., all values are ff >
0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff 19 85 20 03 00 00 00 08

The 1985 and 2003 parts seem to be wrong endian ??

Any ideas to solve the problem ?

The processor is big endian,
kernel version 2.6.18
flash_eraseall is from the git repo at git.infradead.org/mtd-utils.git
busybox version is the latest (1.4.1)

BR,
J.Doo
