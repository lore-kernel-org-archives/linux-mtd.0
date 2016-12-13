Received: from mx.artech.at ([188.21.106.106] helo=mail.artech.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGt8I-0001CN-DX
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2016 19:53:03 +0000
From: Matthias Auchmann <m.auchmann@artech.at>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 13 Dec 2016 20:52:39 +0100
Subject: RE: UBI/UBIFS on NAND with PEB 4MB
Message-ID: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA18@SRV01.ARTech.local>
References: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA17@SRV01.ARTech.local>
In-Reply-To: <566B344A0B1AB14EB2486D887B6FF9E033AFEBBA17@SRV01.ARTech.local>
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

Oh please forgive me, I forgot to mention: I'm on Kernel 4.6.

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Matthias Auchmann
Sent: Tuesday, December 13, 2016 8:41 PM
To: linux-mtd@lists.infradead.org
Subject: UBI/UBIFS on NAND with PEB 4MB

Hi guys!

I'm trying to use UBI and UBIFS on a Micron MT29F32G08ABCDBJ4 SLC NAND with=
 an erase block size 4MB.

First of all, mkfs.ubifs wouldn't support a LEB larger than UBIFS_MAX_LEB_S=
Z being (2*1024*1024).

When I use ubiattach though, it seems to be quite happy, giving me that on =
a 128MB partition:

UBI device number 0, total 32 LEBs (133169152 bytes, 127.0 MiB), available =
8 LEBs (33292288 bytes, 31.8 MiB), LEB size 4161536 bytes (4.0 MiB)

Anyway, when I detach and reattach, it won't work. Details are in the botto=
m of that mail, but since I haven't thoroughly looked into it myself yet, t=
his is only for those who care... I don't want to ask preliminary questions=
.

Anyway, my questions I guess then are:
-) Are there any patches/branches that enable UBIFS to be run with a LEB of=
 4161536?
-) Are there any known limitations with using a 4MiB PEB with UBI itself, o=
r shall I assume for now that the problem is on my board/NAND driver regard=
ing the above ubiattach errors upon the second attach?

Thanks!

BR,

Matthias



*** Please only read this if you care: *** Details about attach/detach/atta=
ch problem.
Upon first attaching, dmesg says:
[  117.483503] ubi0: attaching mtd5
[  117.502347] ubi0: scanning is finished [  117.502353] ubi0: empty MTD de=
vice detected [  117.513280] ubi0: attached mtd5 (name "rootfs01", size 128=
 MiB) [  117.513288] ubi0: PEB size: 4194304 bytes (4096 KiB), LEB size: 41=
61536 bytes [  117.513293] ubi0: min./max. I/O unit sizes: 16384/16384, sub=
-page size 16384 [  117.513299] ubi0: VID header offset: 16384 (aligned 163=
84), data offset: 32768 [  117.513304] ubi0: good PEBs: 32, bad PEBs: 0, co=
rrupted PEBs: 0 [  117.513309] ubi0: user volume: 0, internal volumes: 1, m=
ax. volumes count: 128 [  117.513314] ubi0: max/mean erase counter: 0/0, WL=
 threshold: 4096, image sequence number: 34480849 [  117.513320] ubi0: avai=
lable PEBs: 8, total reserved PEBs: 24, PEBs reserved for bad PEB handling:=
 20 [  117.513333] ubi0: background thread "ubi_bgt0d" started, PID 1637

Anyway, when I detach and reattach, I get this:
ubiattach: error!: cannot attach "/dev/mtd5"
           error 22 (Invalid argument)

dmesg says:
[  359.282384] ubi0: attaching mtd5
[  359.319433] ubi0: scanning is finished [  359.321747] ubi0 error: vtbl_c=
heck: bad CRC at record 0: 0x2b4f6dd5, not 0x000000 [  359.321753] Volume t=
able record 0 dump:
[  359.321757]  reserved_pebs   -16777216
[  359.321760]  alignment       0
[  359.321763]  data_pad        0
[  359.321766]  vol_type        0
[  359.321770]  upd_marker      0
[  359.321773]  name_len        0
[  359.321776]  name            NULL
[  359.321784] ubi0 error: vtbl_check: bad CRC at record 0: 0x2b4f6dd5, not=
 0x000000 [  359.321788] Volume table record 0 dump:
[  359.321791]  reserved_pebs   -16777216
[  359.321794]  alignment       0
[  359.321797]  data_pad        0
[  359.321800]  vol_type        0
[  359.321803]  upd_marker      0
[  359.321807]  name_len        0
[  359.321809]  name            NULL
[  359.321816] ubi0 error: ubi_read_volume_table: both volume tables are co=
rrupted [  359.321836] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd=
5, error -22

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
