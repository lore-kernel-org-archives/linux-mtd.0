Received: from mail1.bemta14.messagelabs.com ([193.109.254.108])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtE7u-00086g-J8
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 12:22:19 +0000
From: "Krug, Markus" <Markus.Krug@bruker.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: MTD mounting problem
Date: Mon, 2 Nov 2015 12:21:53 +0000
Message-ID: <9B6BBBFFF27FBB469F5F9ECB4655AFDA40FBA7@bruexc005.brumgt.local>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
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

Hi,
I have a strange problem with mounting a mtd device (JFFS2) on zynq zed-boa=
rd. I have 6 qspi-flash partitions in the device tree:
=A0
&qspi {
=A0=A0 =A0status =3D "okay";
=A0=A0 =A0is-dual =3D <0>;
=A0=A0 =A0num-cs =3D <1>;
=A0=A0 =A0flash@0 {
=A0=A0 =A0=A0=A0 =A0compatible =3D "n25q128a11";
=A0=A0 =A0=A0=A0 =A0reg =3D <0x0>;
=A0=A0 =A0=A0=A0 =A0spi-tx-bus-width =3D <1>;
=A0=A0 =A0=A0=A0 =A0spi-rx-bus-width =3D <4>;
=A0=A0 =A0=A0=A0 =A0spi-max-frequency =3D <50000000>;
=A0=A0 =A0=A0=A0 =A0#address-cells =3D <1>;
=A0=A0 =A0=A0=A0 =A0#size-cells =3D <1>;
=A0=A0 =A0=A0=A0 =A0partition@qspi-fsbl-uboot {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-fsbl-uboot";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x0 0x100000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@qspi-linux {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-linux";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x100000 0x500000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@qspi-device-tree {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-device-tree";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x600000 0x20000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@qspi-rootfs {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-rootfs";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x620000 0x5E0000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@qspi-bitstream {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-bitstream";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0xC00000 0x400000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0=A0=A0 =A0partition@qspi-data {
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0label =3D "qspi-data";
=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0reg =3D <0x1000000 0x1000000>;
=A0=A0 =A0=A0=A0 =A0};
=A0=A0 =A0};
};
=A0
and /proc/mtd shows:
dev:=A0=A0=A0 size=A0=A0 erasesize=A0 name
mtd0: 00100000 00010000 "qspi-fsbl-uboot"
mtd1: 00500000 00010000 "qspi-linux"
mtd2: 00020000 00010000 "qspi-device-tree"
mtd3: 005e0000 00010000 "qspi-rootfs"
mtd4: 00400000 00010000 "qspi-bitstream"
mtd5: 01000000 00010000 "qspi-data"
So everything seems to be fine.
But in /dev there are only mtd0, mtd1, mtdblock0 and mtdblock1.
So I added with mknod the missing partitions.
Then I run:
flash_eraseall /dev/mtd5 (no problem)
mount -t jffs2 /dev/mtdblock5 /mnt
the mounting failed:
mount: mounting /dev/mtdblock5 on /mnt failed: No such device
=A0
Does someone know whats going wrong?
Thanks for your help,
mk
