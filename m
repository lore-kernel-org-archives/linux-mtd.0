Received: from smtp134.ord.emailsrvr.com ([173.203.6.134])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfPIF-00074W-2p
 for linux-mtd@lists.infradead.org; Wed, 30 Apr 2014 07:51:03 +0000
From: Joshua Lamorie <jpl@xiphos.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Software ECC on NOR Flash
Date: Wed, 30 Apr 2014 07:50:38 +0000
Message-ID: <F55BF8E1AF69024AA3A33A2F2E4876254A2A2087@ORD2MBX03B.mex05.mlsrvr.com>
Content-Language: en-CA
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Berke Durak <berke.durak@xiphos.com>,
 Francesco Ricci <francesco.ricci@xiphos.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello there,=0A=
=0A=
I would like to request some recommendations for how best to implement soft=
ware ECC for NOR flash devices presenting MTD or UBI interfaces.=0A=
=0A=
Background=0A=
=0A=
I am using Linux with MTD on a couple of LEO satellite applications. In the=
 case of NOR flash, even when no write activity occurs the radiation enviro=
nment (primarily energetic protons) can cause bit flips (often from 0 to 1)=
.  Presently, I am presently using various FEC, EDAC and redundancy techniq=
ues on large sections (e.g. kernel and ramdisk images). This works well, bu=
t I would like the flexibility of a UBIFS or JFFS2 system so I can remotely=
 modify individual files (albeit rarely).=0A=
=0A=
Archive Search=0A=
=0A=
I have gone through the linux-mtd archives and I have been unable to find a=
ny specific examples of this. The closest was a series of patches from June=
 2013, referring to a generic 'spinand' framework.=0A=
=0A=
http://lists.infradead.org/pipermail/linux-mtd/2013-June/047339.html=0A=
=0A=
This seems interesting because the implementation appears to target a NOR f=
lash device (S25fl256s) which I don't think has OOB data, and there is a so=
ftware ECC.  However, after following Sourav Poddar's related messages (Jul=
. and Aug.), it appears this was dropped (although mt29f_spinand lived on).=
=0A=
=0A=
Layers=0A=
=0A=
I have been looking into where I might place some type of ECC layer and I b=
elieve my options are:=0A=
=0A=
1) UBI: Add 'extra' ECC data (and functions) to the UBI logical erase block=
.=0A=
2) MTD-MTD: Create an MTD middle layer that uses the current mtd interface =
to read/write/erase the memory device, add some ECC and then present a cont=
rived mtd interface to higher layers.=0A=
3) m25p80: Use blunt-force-trauma to squeeze some hack into the driver's re=
ad/write functions.=0A=
=0A=
I understand that this is a somewhat rare situation, but I'm sure there are=
 plenty of cubesat developers who would jump all over a good solution to th=
is.=0A=
=0A=
Thanks in advance=0A=
=0A=
Joshua Lamorie=0A=
Xiphos Systems Corp=0A=
=0A=
p.s. I am presently lurking around the Embedded Linux Conference if anyone =
wants to talk about this in person.=0A=
=0A=
=0A=
