Received: from mo6-p00-ob.smtp.rzone.de ([2a01:238:20a:202:5300::11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9VPO-00074i-Qi
 for linux-mtd@lists.infradead.org; Thu, 17 Dec 2015 10:03:40 +0000
Received: from ServerDC.bittailors.com (static-87-79-94-160.netcologne.de
 [87.79.94.160]) by smtp.strato.de (RZmta 37.15 AUTH)
 with ESMTPSA id g0237crBHA3BEnm
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp384r1 with 384 ECDH
 bits, eq. 7680 bits RSA)) (Client CN "ServerDC.bittailors.com",
 Issuer "bittailors-CA" (verification FAILED - unable to verify the first
 certificate)) (Client hostname not verified)
 for <linux-mtd@lists.infradead.org>;
 Thu, 17 Dec 2015 11:03:11 +0100 (CET)
From: Ralph Erdmann <rerdmann@bittailors.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI/UBIFS: md5sum of files go bad while running (no powercut)
Date: Thu, 17 Dec 2015 10:03:04 +0000
Message-ID: <2e8aa700cf3c4078a5d735dad29d1b1a@ServerDC.bittailors.com>
Content-Language: de-DE
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

Dear all,
we encounter the following problem on some of our embedded boards in the fi=
eld:
Some files "go bad" during runtime, which causes our application to crash.
A reboot "heals" this error.

Some background:
- Kernel 3.12.1
- Freescale i.Mx28 Cpu
- Micron MT29F1G08ABADAH4IT:D 128MiB NAND SLC Flash
- Filesystem is mounted read only
- ~100 boards in the field
- Error appears randomly, usually after some days of uptime (i have seen so=
mething between 2 and 7 days)
- I can't clearly say if errors appear on all or only some devices

I have created a list of md5sums of all files in the filesystem, that do no=
t change (so no config files, symlinks, temp data, dev, and only 'find -typ=
e f' files). After our application crashed i checked the md5sums and found =
out, that some of our librarys changed (md5 mismatch).

- i observed this 3 or 4 times
- it were always our librarys, but not always the same files (one time only=
 one file was bad, next time it were two, next time again one)
- the librarys are the largest files in the filesystem (~1mb to 5mb each)
- filesystem was still mounted read only at this point
- i was able to backup the damaged files
- there was no power cut
- no output / messages in dmesg
- after a reboot the files were fine again
- i remounted the filesystem rw, md5sums still bad, called linux 'sync', ag=
ain after a reboot the files were fine again
- concerning 'ubinfo -a' there are no bad blocks in flash (see full output =
at the end of this message)
- i have not found a reliable method to reproduce the problem

I screened the subjects of the mailing list of the last six month and i rea=
d a lot about 'The unstable bits issue'. I think our problem is different, =
because it happens after a long runtime and not after a powercut.

Has anyone observed something like that?
I would be very happy about ideas what causes this behaviour .

I am a bit stranded now.

Thank you all for your effort and help!
Kind regards
Ralph

PS: some logs:
The 'ubinfo -a' log:
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:59
Present UBI devices:            ubi0

ubi0
Volumes count:                           4
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     880 (111738880 bytes, 106.6 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  20
Current maximum erase counter value:     14
Minimum input/output unit size:          2048 bytes
Character device major/minor:            247:0
Present volumes:                         0, 1, 2, 4

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        462 LEBs (58662912 bytes, 55.9 MiB)
State:       OK
Name:        filesystem1
Character device major/minor: 247:1
-----------------------------------
Volume ID:   1 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        327 LEBs (41521152 bytes, 39.6 MiB)
State:       OK
Name:        filesystem2
Character device major/minor: 247:2
-----------------------------------
Volume ID:   2 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        17 LEBs (2158592 bytes, 2.1 MiB)
State:       OK
Name:        certs
Character device major/minor: 247:3
-----------------------------------
-----------------------------------
Volume ID:   4 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        50 LEBs (6348800 bytes, 6.1 MiB)
State:       OK
Name:        cfg2
Character device major/minor: 247:5

Some kernel output:
[    1.659580] ONFI param page 0 valid
[    1.663260] ONFI flash detected
[    1.666468] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xf1 (Micron MT=
29F1G08ABADAH4), 128MiB, page size: 2048, OOB size: 64
[    1.678182] Scanning device for bad blocks
[    2.140204] 9 cmdlinepart partitions found on MTD device gpmi-nand
[    2.146439] Creating 9 MTD partitions on "gpmi-nand":
[    2.151681] 0x000000000000-0x000000300000 : "uboot"
[    2.165122] 0x000000300000-0x000000380000 : "ubootenv"
[    2.175378] 0x000000380000-0x000000400000 : "ubootenv_redundant"
[    2.186065] 0x000000400000-0x000000a00000 : "kernel1"
[    2.196459] 0x000000a00000-0x000000a80000 : "fdt1"
[    2.206002] 0x000000a80000-0x000001080000 : "kernel2"
[    2.215806] 0x000001080000-0x000001100000 : "fdt2"
[    2.225309] 0x000001100000-0x000007f00000 : "filesystem"
[    2.235492] 0x000007f00000-0x000008000000 : "reserved"
[    2.245441] gpmi-nand 8000c000.gpmi-nand: driver registered.
[    2.257569] pinctrl-mxs: name=3D<mac0> fsl,voltage=3D1 (0=3D1V8, 1=3D3V3=
)
[    2.265962] of_get_named_gpio_flags exited with status 141
