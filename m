Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D2ANL-0000Pl-6t
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2005 10:49:04 -0500
Date: Fri, 18 Feb 2005 16:48:58 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050218154853.GB5926@synertronixx3>
References: <20050218154216.GA5926@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050218154216.GA5926@synertronixx3>
Subject: Re: freeze when mounting fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-18 16:42 +0100 schrieb Konstantin Kletschke:

I did

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=2
# CONFIG_JFFS2_FS_NAND is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y
CONFIG_JFFS2_RUBIN=y
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=y

And when mounting functional rootfs it speaks a lot, but:

root@scb9328 ~ # mount -t jffs2 /dev/mtdblock4 /mnt

[ ... silence ... ]

Rootfs is at http://ludenkalle.de/mtd/52

created with 

mkfs.jffs2 -q --eraseblock=128KiB -o /tftpboot/52 -D
/home/konsti/svn/ptxdist-0.5.2-trunk/src/device_table.txt
--root=/home/konsti/svn/ptxdist-0.5.2-trunk/root

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
