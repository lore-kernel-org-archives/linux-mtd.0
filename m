Received: from mail1.bemta23.messagelabs.com ([67.219.246.212])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJxnd-0001DB-Vg
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 09:37:33 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>, "ikegami_to@yahoo.co.jp"
 <ikegami_to@yahoo.co.jp>
CC: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Felix Fietkau <nbd@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Koen Vandeputte
 <koen.vandeputte@ncentric.com>, Fabio Bettoni <fbettoni@gmail.com>
Subject: RE: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change do_write_oneword()
 to use chip_good()
Date: Tue, 6 Nov 2018 09:37:12 +0000
Message-ID: <TYAPR01MB2175DC25466FFE541722809DDCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
References: <20181025163219.25788-1-ikegami@allied-telesis.co.jp>
 <20181025163219.25788-2-ikegami@allied-telesis.co.jp>
 <20181105111544.4e511ed9@bbrezillon>
 <TYAPR01MB217579A7E16A687FE04B90E5DCCB0@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20181106093334.35864341@bbrezillon>
In-Reply-To: <20181106093334.35864341@bbrezillon>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris-san,

> -----Original Message-----
> From: stable-owner@vger.kernel.org
> [mailto:stable-owner@vger.kernel.org] On Behalf Of Boris Brezillon
> Sent: Tuesday, November 06, 2018 5:34 PM
> To: IKEGAMI Tokunori
> Cc: boris.brezillon@free-electrons.com; Felix Fietkau; Hauke Mehrtens;
> stable@vger.kernel.org; Joakim Tjernlund; PACKHAM Chris;
> linux-mtd@lists.infradead.org; Koen Vandeputte; Fabio Bettoni
> Subject: Re: [PATCH v3 01/11] mtd: cfi_cmdset_0002: Change
> do_write_oneword() to use chip_good()
>=20
> Hi IKEGAMI,
>=20
> On Tue, 6 Nov 2018 00:25:43 +0000
> IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:
>=20
> > > > Also the issue can be fixed by using chip_good() instead of
> chip_ready().
> > > > The chip_ready() just checks the value from flash memory twice.
> > > > And the chip_good() checks the value with the expected value.
> > > > Probably the issue can be fixed as checked correctly by the chip_go=
od().
> > > > So change to use chip_good() instead of chip_ready().
> > >
> > > Well, that's not really explaining why you think chip_good() should
> be
> > > used instead of chip_ready(). So I went on and looked at the
> > > chip_good(), chip_ready() and do_write_oneword() implementation, and
> > > also looked at users of do_write_oneword(). It seems this function is
> > > used to write data to the flash, and apparently the "one bit should
> > > toggle to reflect a busy state" does not apply when writing things to
> > > the memory array (it's probably working for other CFI commands, but
> I
> > > guess it takes more time to actually change the level of a NOR cell,
> > > hence the result of 2 identical reads does not mean that the write is
> > > done).
> > >
> > > Also, it seems that cmdset_0001 is not implementing chip_ready() the
> > > same way, and I wonder if cmdset_0002 implementation is correct to
> > > start with. Or maybe I don't get what chip_ready() is for.
> > >
> > > Anyway, this is the sort of clarification I'd like to have.
> >
> > I am thinking to update the commit message as below.
> >
> >     mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword(=
)
> >
> >     As reported by the OpenWRT team, write requests sometimes fail on
> some
> >     platforms.
> >     Currently to check the state chip_ready() is used correctly as
> described by
> >     the flash memory S29GL256P11TFI01 datasheet.
>=20
> I had a look at the S29GL256P datasheet here [1], and if I'm correct,
> it's using cmdset 0001.

No actually the cmdset 0002 is used on the flash chip.
The manufacturer ID xx01h and Device ID 2201h are used to decide.

There is information from Fobis-san below also about this.

On forum thread musashino posted picture of flash chip:
https://forum.openwrt.org/t/impossible-to-install-update-any-packages-on-wz=
r-hp-g300nh-18-06-1
http://www.cypress.com/part/s29gl256p11tfi010

[    0.862264] physmap platform flash device: 02000000 at 1e000000
[    0.868331] physmap-flash: Found 1 x16 devices at 0x0 in 16-bit
bank. Manufacturer ID 0x000001 Chip ID 0x002201
[    0.878493] Amd/Fujitsu Extended Query Table at 0x0040
[    0.883668]   Amd/Fujitsu Extended Query version 1.3.
[    0.888768] number of CFI chips: 1
[    0.894557] Searching for RedBoot partition table in physmap-flash
at offset 0x1fc0000
[    0.918009] Searching for RedBoot partition table in physmap-flash
at offset 0x1fe0000
[    0.941464] No RedBoot partition table detected in physmap-flash
[    0.947926] Creating 5 MTD partitions on "physmap-flash":
[    0.953384] 0x000000000000-0x000000040000 : "u-boot"
[    0.960853] 0x000000040000-0x000000060000 : "u-boot-env"
[    0.968803] 0x000000060000-0x000001fc0000 : "firmware"
[    0.981859] 2 uimage-fw partitions found on MTD device firmware
[    0.987900] 0x000000060000-0x0000001b5706 : "kernel"
[    0.994916] 0x0000001b5706-0x000001fc0000 : "rootfs"
[    1.001986] mtd: device 4 (rootfs) set to be root filesystem
[    1.007789] 1 squashfs-split partitions found on MTD device rootfs
[    1.014014] 0x0000003c0000-0x000001fc0000 : "rootfs_data"
[    1.022093] 0x000001fc0000-0x000001fe0000 : "user_property"
[    1.030283] 0x000001fe0000-0x000002000000 : "art"

Maybe you could post links to forum thread, and data sheet.

>=20
> >     Also chip_good() is used to check if the write is succeeded and it
> was
> >     implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve
> error
> >     checking").
> >     But actually the write failure is caused on some platforms and also
> it can
> >     be fixed by using chip_good() to check the state and retry instead.
>=20
> Do you know on which NOR chips this happens? Do you have access to the
> datasheet?

But it looks SST49LF008A [3] from the changes below but I am not sure at th=
is moment and probably it should be confirmed to the authr Eric W. Biederma=
nn <ebiederman@lnxi.com> to make sure.

+#define SST49LF008A            0x005a

 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u=
_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_=
t *, const u_char *);
@@ -191,6 +192,7 @@ static struct cfi_fixup cfi_fixup_table[] =3D {
 };
 static struct cfi_fixup jedec_fixup_table[] =3D {
        { MANUFACTURER_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
+       { MANUFACTURER_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },

>=20
> >     It is depended on the actual flash chip behavior so the root cause
> is
> >     unknown.
>=20
> Yes, and that's what I'd like you to figure out, or at least have a
> good idea why this doesn't work on some chips but works on others.

I see.
But it is a little bit difficult situation since I do not have the failure =
environment locally at this moment.
But if needed I may ask to get the help for this to Fabio-san.

>=20
> >
> > If any comment please let me know.
> >
> > >
> > > >
> > > > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > > > Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > Signed-off-by: Fabio Bettoni <fbettoni@gmail.com>
> > >
> > > Has the patch really gone through all those people? SoB is used when
> you
> > > apply a patch in your tree or when you're the original author.
> >
> > I have just checked the OpenWRT git log again and it looks that it was
> originally
> > implemented by Felix Fietkau <nbd@openwrt.org> by the patch below so I
> will update the Signed-off-by tag as so.
> >
> <https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dcommitdiff;h=3D2530=
640
> f07cd2b3b14fe9ec03fa63a586452cc5f>
> >
> > >
> > > > Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
> > > > Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
> > > > Co-Developed-by: Fabio Bettoni <fbettoni@gmail.com>
> > >
> > > Not sure we want to add new undocumented tags, but you can mention
> > > that all those people helped you find/debug the issue. They can also
> > > add their Reviewed-by/Tested-by if they like.
>=20
> My bad, I just noticed these are valid flags [2], so you can keep them,
> and according to the doc, you should also keep the SoB.

I see.
Yes I had also checked it.

By the way in near future my company email address will be not able to use.
So I will change the mail address to my personal email address [4] after th=
at or before.

Regards,
Ikegami

>=20
> Regards,
>=20
> Boris
>=20
> [1]http://www.cypress.com/file/219926/download
> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> tree/Documentation/process/submitting-patches.rst?h=3Dv4.20-rc1#n546

[3]https://www.microchip.com/wwwproducts/en/SST49LF008A
[4]ikegami_to@yahoo.co.jp
