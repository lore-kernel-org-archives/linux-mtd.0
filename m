Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4TkR-0008M5-OA
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 06:49:24 +0000
Received: by gyb11 with SMTP id 11so3773737gyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Apr 2010 23:49:22 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Apr 2010 08:49:21 +0200
Message-ID: <y2na57e67db1004202349ya937fa60v70ac540cfd60d076@mail.gmail.com>
Subject: m25p80 and mkfs.jffs2
From: Jernej Turnsek <jernej.turnsek@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am developing the platform with i.MX25 CPU, 128MB of RAM and 8MB of
AT25DF641 Flash.
I would like to set the rootfs on 6MB jffs2 partition in Flash memory.
Rootfs was built with the
OpenEmbedded and the following settings:

EXTRA_IMAGECMD_jffs2 =3D "--little-endian --eraseblock=3D0x1000 -n \
=A0=A0=A0 --pad ; sumtool --eraseblock=3D0x1000 -n \
=A0=A0=A0 --littleendian --pad \
=A0=A0=A0 -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
=A0=A0=A0 -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2.summary"

The problem is the provided erase size of 4096 bytes, because the tool
mkfs.jffs2 automatically
increases erasesize to 8KiB. The driver M25P80 in the Linux kernel has
a lookup table where the
erase size for the AT25DF641 is set to 4KB:

{ "at25df641",=A0 INFO(0x1f4800, 0, 64 * 1024, 128, SECT_4K) },

If I am not mistaken, the jffs2 fs takes the provided erase size from
the mtd, which is 4KB, but
mkfs.jffs2 packs the image with 8KB, thus after boot up I get errors
in the mounting process.

My options are to set 0 instead of SECT_4K and live with the default
64KB sectors, or patch the
driver to set the erasesize to 8KiB instead of 4KB.

I would prefer not to change anything in the m25p80 driver. Is there
another way to fix the problem?

Thanks,

Jernej
