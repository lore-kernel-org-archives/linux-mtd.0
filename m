Received: from web30207.mail.mud.yahoo.com ([209.191.69.54])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pjr6k-0005l1-LJ
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2011 10:35:43 +0000
Message-ID: <194189.91256.qm@web30207.mail.mud.yahoo.com>
Date: Mon, 31 Jan 2011 02:35:41 -0800 (PST)
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

Hi,=0A=0AI am trying to mount an UBI volume, but it fails:=0A=0A# mount -t =
ubifs ubi0_0 /mnt/ubi=0Amount: mounting ubi0_0 on /mnt/ubi failed: No such =
device=0A =0AUsing mkfs.ubifs and ubinize I have prepared an image containi=
ng three volumes. On the target I have used ubiformat to flash the image an=
d ubiattach to attach to mtd1.=0A=0ATarget kernel: 2.6.29, platform m68k (m=
cf54418). The UBI tools on the host are built from git://git.infradead.org/=
mtd-utils.git.=0A=0AEverything looks fine to me, see below, but how do I mo=
unt a volume? I have tried various ways to refer to the device (like ubi0:d=
atafs, ubi0_0) without luck.=0A=0AThanks for any help!=0A=0A[root@M54418TWR=
 /]# ls -l /dev/ubi*=0A=0Acrw-rw---- 1 root root 252,  0 Nov 24 17:54 /dev/=
ubi0=0Acrw-rw---- 1 root root 252,  1 Nov 24 17:54 /dev/ubi0_0=0Acrw-rw----=
 1 root root 252,  2 Nov 24 17:54 /dev/ubi0_1=0Acrw-rw---- 1 root root 252,=
  3 Nov 24 17:54 /dev/ubi0_2=0Acrw-rw---- 1 root root  10, 63 Nov 24 17:31 =
/dev/ubi_ctrl=0A =0A[root@M54418TWR /]# ubinfo -a=0AUBI version:           =
         1=0ACount of UBI devices:           1=0AUBI control device major/m=
inor: 10:63=0APresent UBI devices:            ubi0=0A =0Aubi0:=0AVolumes co=
unt:                           3=0ALogical eraseblock size:                =
 126976=0ATotal amount of logical eraseblocks:     2036 (258523136 bytes, 2=
46.5 MiB)=0AAmount of available logical eraseblocks: 0 (0 bytes)=0AMaximum =
count of volumes                 128=0ACount of bad physical eraseblocks:  =
     4=0ACount of reserved physical eraseblocks:  20=0ACurrent maximum eras=
e counter value:     5=0AMinimum input/output unit size:          2048 byte=
s=0ACharacter device major/minor:            252:0=0APresent volumes:      =
                   0, 1, 2=0A =0AVolume ID:   0 (on ubi0)=0AType:        dy=
namic=0AAlignment:   1=0ASize:        1058 LEBs (134340608 bytes, 128.1 MiB=
)=0AState:       OK=0AName:        rootfs=0ACharacter device major/minor: 2=
52:1=0A-----------------------------------=0AVolume ID:   1 (on ubi0)=0ATyp=
e:        dynamic=0AAlignment:   1=0ASize:        133 LEBs (16887808 bytes,=
 16.1 MiB)=0AState:       OK=0AName:        progfs=0ACharacter device major=
/minor: 252:2=0A-----------------------------------=0AVolume ID:   2 (on ub=
i0)=0AType:        dynamic=0AAlignment:   1=0ASize:        821 LEBs (104247=
296 bytes, 99.4 MiB)=0AState:       OK=0AName:        datafs=0ACharacter de=
vice major/minor: 252:3=0A =0A=0A=0A=0A      
