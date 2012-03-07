Received: from nm17.bullet.mail.ird.yahoo.com ([77.238.189.70])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5K5H-0003Nu-Uk
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:51:28 +0000
Message-ID: <1331139085.50366.YahooMailClassic@web29001.mail.ird.yahoo.com>
Date: Wed, 7 Mar 2012 16:51:25 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: UBI/ubifs problem
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: =?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Wed, 7/3/12, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:=0A>=
 Is it possible to get mkfs.ubifs to create an image without=0A> specifying=
 the max-leb-count ? I.e. just to create an image=0A> that is as big as it =
has to be. Admittedly, one would have=0A> to figure out the size of the res=
ulting volume afterwards,=0A> to provide an allocation size for ubimkvol or=
 ubinize, so=0A> perhaps it would help much.=0A=0AWhen I first started to t=
ry out UBI/UBIFS I had problems understanding the=0Aarithmetic, and it took=
 several attempts to get it working.=0A=0AIn the end I created a simple she=
ll script to do all the hard work for me.=0A=0AGiven the UBI MTD partition =
size, PEB size, and desired volume sizes, the=0Ascript would do the rest:=
=0A=0A#!/bin/bash=0A=0A#=0A#=09Create UBI for 125MiB MTD on NOR flash, cons=
isting of:=0A#=0A#=09=09UBI overhead.=0A#=09=09Volume 0: rootfs, 75MiB less=
 UBI overhead.=0A#=09=09Volume 1: homefs, 50MiB.=0A#=0A=0Adeclare -r rootim=
g=3D"rootfs.img"=0Adeclare -r homeimg=3D"homefs.img"=0Adeclare -r ipaqcfg=
=3D"ipaq.cfg"=0A=0Adeclare -ir KiB=3D1024=0Adeclare -ir MiB=3D$((1024*1024)=
)=0A=0Adeclare -i UBI=3D$((125*MiB))=09=09=09# UBI size=0Adeclare -i Sp=3D$=
((256*KiB))=09=09=09# PEB size=0Adeclare -i P=3D$((UBI/Sp))=09=09=09# Total=
 number of PEBs=0Adeclare -i O=3D128=09=09=09=09# EC header + VID header ov=
erhead=0Adeclare -i Sl=3D$((Sp-O))=09=09=09=09# LEB size=0Adeclare -i B=3D0=
=09=09=09=09=09# NOR does not have bad PEBs=0Adeclare -i U=3D$((((B+4)*Sp)+=
(O*(P-B-4))))=09# UBI overhead=0Adeclare -i Ur=3D$(((U+Sp-1)&(~(Sp-1))))=09=
=09# UBI overhead rounded up to next PEB size=0A=0Adeclare -i ROOTFS=3D$(((=
75*MiB)-Ur))=09=09# rootfs size=0Adeclare -i HOMEFS=3D$((50*MiB))=09=09=09#=
 homefs size=0A=0Acmd=3D"mkfs.ubifs --root=3Drootfs --output=3D${rootimg} -=
m 1 -e ${Sl} -c $((ROOTFS/Sp)) -x none"=0Aecho ${cmd}=0A${cmd} || exit 1=0A=
=0Acmd=3D"mkfs.ubifs --root=3Dhomefs --output=3D${homeimg} -m 1 -e ${Sl} -c=
 $((HOMEFS/Sp)) -x none"=0Aecho ${cmd}=0A${cmd} || exit 1=0A=0Arm -f ${ipaq=
cfg}=0Aecho "[rootfs]" >> ${ipaqcfg}=0Aecho "mode=3Dubi" >> ${ipaqcfg}=0Aec=
ho "image=3D${rootimg}" >> ${ipaqcfg}=0Aecho "vol_id=3D0" >> ${ipaqcfg}=0Ae=
cho "vol_size=3D$((((ROOTFS)/Sp)*Sl))" >> ${ipaqcfg}=0Aecho "vol_type=3Ddyn=
amic" >> ${ipaqcfg}=0Aecho "vol_name=3Drootfs" >> ${ipaqcfg}=0Aecho "[homef=
s]" >> ${ipaqcfg}=0Aecho "mode=3Dubi" >> ${ipaqcfg}=0Aecho "image=3D${homei=
mg}" >> ${ipaqcfg}=0Aecho "vol_id=3D1" >> ${ipaqcfg}=0Aecho "vol_size=3D$((=
((HOMEFS)/Sp)*Sl))" >> ${ipaqcfg}=0Aecho "vol_type=3Ddynamic" >> ${ipaqcfg}=
=0Aecho "vol_name=3Dhomefs" >> ${ipaqcfg}=0A=0Acmd=3D"ubinize -o ipaq.ubi -=
p ${Sp} -m 1 -v ${ipaqcfg}"=0Aecho ${cmd}=0A${cmd} || exit 1=0A=0AIt works =
for me. Hopefully it might be useful to others.
