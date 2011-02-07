Received: from web30203.mail.mud.yahoo.com ([209.191.69.50])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmSee-0000k7-Mm
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 15:05:29 +0000
Message-ID: <130828.38998.qm@web30203.mail.mud.yahoo.com>
Date: Mon, 7 Feb 2011 07:05:24 -0800 (PST)
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

> On Mon, 2011-01-31 at 02:35 -0800, Lars Michael wrote:=0A> > Hi,=0A> >=0A=
> > I am trying to mount an UBI volume, but it fails:=0A> >=0A> > # mount -=
t ubifs ubi0_0 /mnt/ubi=0A> > mount: mounting ubi0_0 on /mnt/ubi failed: No=
 such device=0A> >=0A> > Using mkfs.ubifs and ubinize I have prepared an im=
age containing =0A> > three volumes. On the target I have used ubiformat to=
 flash the =0A> > image and ubiattach to attach to mtd1.=0A> >=0A> > Target=
 kernel: 2.6.29, platform m68k (mcf54418). The UBI tools on =0A> > the host=
 are built from git://git.infradead.org/mtd-utils.git.=0A> >=0A> > Everythi=
ng looks fine to me, see below, but how do I mount a volume? =0A> > I have =
tried various ways to refer to the device (like ubi0:datafs,=0A> > ubi0_0) =
without luck.=0A> >=0A> > Thanks for any help!=0A> =0A> Do you have ubifs i=
n /proc/filesystems?=0A> =0A=0AWell, no! UBIFS is included in the kernel, w=
hy doesn't it show up?=0ANow I changed it to a kernel object and now it app=
ears in proc/filesystems after running insmod.=0A=0ANext I try to attach ag=
ain. But now other errors occur, see below:=0A=0A[root@M54418TWR /]# ubiatt=
ach /dev/ubi_ctrl -m 1=0AUBI: attaching mtd1 to ubi0=0AUBI: physical eraseb=
lock size:   131072 bytes (128 KiB)=0AUBI: logical eraseblock size:    1269=
76 bytes=0AUBI: smallest flash I/O unit:    2048=0AUBI: VID header offset: =
         2048 (aligned 2048)=0AUBI: data offset:                4096=0AUBI:=
 volume 2 ("datafs") re-sized from 133 to 821 LEBs=0AUBI: attached mtd1 to =
ubi0=0AUBI: MTD device name:            "ubi"=0AUBI: MTD device size:      =
      255 MiB=0AUBI: number of good PEBs:        2036=0AUBI: number of bad =
PEBs:         4=0AUBI: max. allowed volumes:       128=0AUBI: wear-leveling=
 threshold:    4096=0AUBI: number of internal volumes: 1=0AUBI: number of u=
ser volumes:     3=0AUBI: available PEBs:             0=0AUBI: total number=
 of reserved PEBs: 2036=0AUBI: number of PEBs reserved for bad PEB handling=
: 20=0AUBI: max/mean erase counter: 6/2=0AUBI: background thread "ubi_bgt0d=
" started, PID 642 UBI device number 0, total 2036 LEBs (258523136 bytes, 2=
46.5 MiB), available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB) [r=
oot@M54418TWR /]# UBI: scrubbed PEB 9, data moved to PEB 2035=0AUBI: scrubb=
ed PEB 10, data moved to PEB 1963=0AUBI: scrubbed PEB 13, data moved to PEB=
 1767 ...=0AUBI: scrubbed PEB 860, data moved to PEB 1098=0AUBI: scrubbed P=
EB 863, data moved to PEB 1097 UBI warning: ubi_eba_copy_leb: read data bac=
k from PEB 1092 and it is different UBI error: wear_leveling_worker: error =
-22 while moving PEB 868 to PEB 1092 UBI warning: ubi_ro_mode: switch to re=
ad-only mode UBI error: do_work: work failed with error code -22 UBI error:=
 ubi_thread: ubi_bgt0d: work failed with error code -22=0A=0ARegards,=0A- L=
ars Michael=0A=0A=0A=0A      
