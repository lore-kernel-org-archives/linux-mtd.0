Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDW2a-0007Hp-25
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 14:46:18 +0000
Date: Fri, 19 Oct 2018 16:45:53 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Russell Senior <russell@personaltelco.net>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Message-ID: <1457198086.5374.1539960353710.JavaMail.zimbra@nod.at>
In-Reply-To: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
References: <CACna6rx3YBNYKGu7T-J2J-S_3yr-oafJf3pL5TbGDFRzU6dihg@mail.gmail.com>
Subject: Re: Regression in handling power cuts since 3a1e819b4e80 ("ovl:
 store file handle of lower inode on copy up")
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rafa=C5=82,

----- Urspr=C3=BCngliche Mail -----
> Von: "Rafa=C5=82 Mi=C5=82ecki" <zajec5@gmail.com>
> An: "Amir Goldstein" <amir73il@gmail.com>, "Miklos Szeredi" <miklos@szere=
di.hu>, linux-unionfs@vger.kernel.org,
> linux-fsdevel@vger.kernel.org, "richard" <richard@nod.at>, "Artem Bityuts=
kiy" <dedekind1@gmail.com>, "Adrian Hunter"
> <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, "Russell Senior=
" <russell@personaltelco.net>, "OpenWrt
> Development List" <openwrt-devel@lists.openwrt.org>
> Gesendet: Freitag, 19. Oktober 2018 14:31:29
> Betreff: Regression in handling power cuts since 3a1e819b4e80 ("ovl: stor=
e file handle of lower inode on copy up")

> Hi,
>=20
> Since OpenWrt switch from kernel 4.9 to 4.14 users started randomly
> reporting file system corruptions. OpenWrt uses overlay(fs) with
> squashfs as lowerdir and ubifs as upperdir. Russell managed to isolate
> & describe test case for reproducing corruption when doing a power cut
> after first boot.
>=20
> Interestingly it cannot be reproduced on all devices (NAND dependant?
> arch dependant?!). I couldn't reproduce that problem on none of my
> Broadcom devices (ARM=3Dy ARCH_BCM_5301X=3Dy) so I had to buy Ubiquiti
> EdgeRouter X (ER-X) (MIPS=3Dy RALINK=3Dy). I reproduced it then and
> bisected down to the commit 3a1e819b4e80 ("ovl: store file handle of
> lower inode on copy up").
>=20
> FWIW I was told it also affects:
> Asus RT-AC58U (ARCH_IPQ40XX=3Dy)
> powerpc
> RB493G, DIR-860L (ATH79=3Dy)
>=20
> Steps to reproduce the problem:
> 1) Flash firmware
> 2) Boot (for the first time)
> 3) Let the init script copy config files from lowerdir to the upperdir
> 4) Wait for boot to finish
> 5) Verify content of some unmodified config on overlay, using either:
> hexdump -C /etc/config/dropbear
> hexdump -C /overlay/upper/etc/config/dropbear
> 6) Power cut & boot again
> 7) Check the content of the same file

Do you have something also I can test?
A C reproducer? An xfstest case?

> After above regressing commit the later check confirms the file size
> looks correct but it's filled with all 00-es only.
>=20
> Can I ask you to check if there is something possibly wrong with the
> above ovl commit? Or does it expose some problem with the ubifs? Or
> maybe the whole UBI?

Well, I fear it uncovers a problem in UBIFS. We had already problems with o=
verlayfs.
Did you bisect the problem and you are sure that the said commit is the fir=
st bad commit?
=20
> FWIW testing above commit (and one before it) always results in single
> error in the kernel log:
> [   14.250184] UBIFS error (ubi0:1 pid 637): ubifs_add_orphan: orphaned t=
wice

Please show the full log.
The orphan thing rings a bell, we had such a bug already.

Thanks,
//richard
