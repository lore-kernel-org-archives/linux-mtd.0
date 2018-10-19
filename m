Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDTwX-00069k-Lc
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 12:32:40 +0000
Received: by mail-wm1-x343.google.com with SMTP id 189-v6so3461751wmw.2
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 05:31:42 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 19 Oct 2018 14:31:29 +0200
Message-ID: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
Subject: Regression in handling power cuts since 3a1e819b4e80 ("ovl: store
 file handle of lower inode on copy up")
To: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Russell Senior <russell@personaltelco.net>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Content-Type: text/plain; charset="UTF-8"
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

Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
reporting file system corruptions. OpenWrt uses overlay(fs) with
squashfs as lowerdir and ubifs as upperdir. Russell managed to isolate
& describe test case for reproducing corruption when doing a power cut
after first boot.

Interestingly it cannot be reproduced on all devices (NAND dependant?
arch dependant?!). I couldn't reproduce that problem on none of my
Broadcom devices (ARM=3Dy ARCH_BCM_5301X=3Dy) so I had to buy Ubiquiti
EdgeRouter X (ER-X) (MIPS=3Dy RALINK=3Dy). I reproduced it then and
bisected down to the commit 3a1e819b4e80 ("ovl: store file handle of
lower inode on copy up").

FWIW I was told it also affects:
Asus RT-AC58U (ARCH_IPQ40XX=3Dy)
powerpc
RB493G, DIR-860L (ATH79=3Dy)

Steps to reproduce the problem:
1) Flash firmware
2) Boot (for the first time)
3) Let the init script copy config files from lowerdir to the upperdir
4) Wait for boot to finish
5) Verify content of some unmodified config on overlay, using either:
hexdump -C /etc/config/dropbear
hexdump -C /overlay/upper/etc/config/dropbear
6) Power cut & boot again
7) Check the content of the same file

After above regressing commit the later check confirms the file size
looks correct but it's filled with all 00-es only.

Can I ask you to check if there is something possibly wrong with the
above ovl commit? Or does it expose some problem with the ubifs? Or
maybe the whole UBI?

FWIW testing above commit (and one before it) always results in single
error in the kernel log:
[   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphaned twi=
ce

That UBIFS error doesn't occur with 4.12.14. Unfortunately it's
impossible to cleanly revert 3a1e819b4e80 from the top of 4.12.14.

--=20
Rafa=C5=82
