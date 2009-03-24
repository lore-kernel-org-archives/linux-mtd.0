Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm650-000849-LV
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 12:50:14 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 24 Mar 2009 13:49:57 +0100
References: <200903230852.02597.jbe@pengutronix.de>
	<200903232029.32897.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624080@EXGMBX01.sasken.com>
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624080@EXGMBX01.sasken.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200903241349.58312.jbe@pengutronix.de>
Subject: Re: DOC2000 flash: Do I miss something?
Cc: Ravi Vasarla <ravi.vasarla@sasken.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Dienstag, 24. M=E4rz 2009, Ravi Vasarla wrote:
> Just check with nandwrite with option -j (--jffs2 oob layout) instead of
> autoplace oob layout.

I tried:

$ flash_eraseall -j /dev/mtd1
$ nandwrite -j /dev/mtd1 /root.jffs2
MEMSETOOBSEL: Inappropriate ioctl for device

Only the "-a" option given to "nandwrite" works. Maybe my image is wrong. I=
=20
took a look into the email archives you mentioned and change it to:

(note: Host is x86 and also the target)

$ mkfs.jffs2 -d images/work_dir --eraseblock=3D0x4000 -n -p \
	--pagesize=3D512 -o images/root.jffs2

I'm unsure about the eraseblock and pagesize option. /proc/mtd tells me:

$ cat /proc/mtd
dev:    size   erasesize  name
[...]
mtd1: 01000000 00004000 "DiskOnChip 2000 (NFTL Model)"

But nothing about the pagesize.

Regards,
Juergen
