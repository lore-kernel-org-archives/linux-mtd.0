Received: from web30204.mail.mud.yahoo.com ([209.191.69.51])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pn9FF-0002GZ-QE
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2011 12:34:08 +0000
Message-ID: <771706.3446.qm@web30204.mail.mud.yahoo.com>
Date: Wed, 9 Feb 2011 04:34:03 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: mount ubi volume fails: No such device
To: linux-mtd@lists.infradead.org
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

> On Mon, 2011-02-07 at 07:05 -0800, Lars Michael wrote:=0A> > UBI: scrubbe=
d PEB 863, data moved to PEB 1097 UBI warning:=0A> ubi_eba_copy_leb: read d=
ata back from PEB 1092 and it is different UBI=0A> error: wear_leveling_wor=
ker: error -22 while moving PEB 868 to PEB 1092=0A> UBI warning: ubi_ro_mod=
e: switch to read-only mode UBI error: do_work:=0A> work failed with error =
code -22 UBI error: ubi_thread: ubi_bgt0d: work=0A> failed with error code =
-22=0A> =0A> It says you that it wrote some date, then read it back, compar=
ed, and=0A> the data did not match. You need to start with validating your =
falash=0A> drivers - use mtd tests:=0A> =0A> http://www.linux-mtd.infradead=
.org/doc/general.html#L_mtd_tests=0A> =0A=0AI formatted and wrote the image=
 again. ubiattach _sometimes_ completes without the error code -22. In this=
 case the mount went ok. But mount sometimes fails completely (structure ne=
eds cleaning), other times errors are reported but successfully recovered. =
So it seems to work, but no in=0Aa reliable way. Any suggestions on how to =
improve it? My kernel is 2.6.29 so perhaps some patches are needed?=0A=0AFo=
r example:=0A=0A[root@M54418TWR /]# mount -t ubifs ubi0:rootfs /mnt/ubi_roo=
tfs=0AUBIFS error (pid 661): ubifs_scan: garbage=0AUBIFS error (pid 661): u=
bifs_scanned_corruption: corrupted data at LEB 2:8192=0AUBIFS error (pid 66=
1): ubifs_scanned_corruption: first 4096 bytes from LEB 2:8192=0AUBIFS erro=
r (pid 661): ubifs_scan: LEB 2 scanning failed=0AUBIFS error (pid 661): ubi=
fs_scan: corrupt empty space at LEB 5:69632=0AUBIFS error (pid 661): ubifs_=
scanned_corruption: corrupted data at LEB 5:69632=0AUBIFS error (pid 661): =
ubifs_scanned_corruption: first 4096 bytes from LEB 5:69632=0AUBIFS error (=
pid 661): ubifs_scan: LEB 5 scanning failed=0Amount: mounting ubi0:rootfs o=
n /mnt/ubi_rootfs failed: Structure needs cleaning=0A=0Aor:=0A=0Amount -t u=
bifs ubi0:datafs /mnt/udatafs=0AUBIFS error (pid 670): ubifs_scan: garbage=
=0AUBIFS error (pid 670): ubifs_scanned_corruption: corrupted data at LEB 2=
:4096=0AUBIFS error (pid 670): ubifs_scanned_corruption: first 4096 bytes f=
rom LEB 2:4096=0AUBIFS error (pid 670): ubifs_scan: LEB 2 scanning failed=
=0AUBIFS: recovery needed=0AUBIFS error (pid 670): ubifs_scan: garbage=0AUB=
IFS error (pid 670): ubifs_scanned_corruption: corrupted data at LEB 4:0=0A=
UBIFS error (pid 670): ubifs_scanned_corruption: first 4096 bytes from LEB =
4:0=0AUBIFS error (pid 670): ubifs_scan: LEB 4 scanning failed=0AUBIFS: rec=
overy completed=0AUBIFS: mounted UBI device 0, volume 2, name "datafs"=0AUB=
IFS: file system size:   4952064 bytes (4836 KiB, 4 MiB, 39 LEBs)=0AUBIFS: =
journal size:       1142785 bytes (1116 KiB, 1 MiB, 9 LEBs)=0AUBIFS: media =
format:       4 (latest is 4)=0AUBIFS: default compressor: lzo=0AUBIFS: res=
erved for root:  0 bytes (0 KiB)=0A=0ARegards,=0A- Lars=0A=0A=0A=0A=0A     =
 
