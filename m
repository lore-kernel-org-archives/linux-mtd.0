Received: from mail-am1on0125.outbound.protection.outlook.com
 ([157.56.112.125] helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0S8m-0002l9-Ix
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 11:17:21 +0000
From: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
To: Richard Weinberger <richard@nod.at>
CC: "CN, Aananth (A.A.)" <caananth@visteon.com>, "Gunasundar, Balamanikandan
 (B.)" <bgunasun@visteon.com>, "babu3@visteon.com" <babu3@visteon.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>, "adrian.hunter@intel.com"
 <adrian.hunter@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gnanachandran@gmail.com"
 <gnanachandran@gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
Date: Wed, 11 May 2016 11:16:57 +0000
Message-ID: <20160511112630.GB22640@visteon-gnana>
References: <20160510122343.GB16841@visteon-gnana>
 <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
 <20160510145836.GA18568@visteon-gnana> <573210D8.6030603@nod.at>
 <20160511065223.GA22220@visteon-gnana> <20160511073836.GA22640@visteon-gnana>
 <5732F9C7.6020206@nod.at>
In-Reply-To: <5732F9C7.6020206@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F137E559DBC17C47B502078E09E3DD11@eurprd06.prod.outlook.com>
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

On Wed, May 11, 2016 at 11:22:15AM +0200, Richard Weinberger wrote:
> Am 11.05.2016 um 09:29 schrieb DHANAPAL, GNANACHANDRAN (G.):
> > On Wed, May 11, 2016 at 12:22:23PM +0530, Gnanachandran Dhanapal wrote:
> >> On Tue, May 10, 2016 at 06:48:24PM +0200, Richard Weinberger wrote:
> >>> Am 10.05.2016 um 16:49 schrieb DHANAPAL, GNANACHANDRAN (G.):
> >>>> Thanks for the reply, Richard.=20
> >>>> Please find two files in google drive share.
> >>>>
> >>>> 	1. dump_mtd7_ecc.log   - /dev/mtd7 dump with ecc
> >>>> 	2. leb_peb_map_22706.log   - LEB to PEB map. This information is ta=
ken by having print in table.
> >>>>
> >>>> Share:
> >>>> 	https://drive.google.com/open?id=3D0B7tYZDLZ_KAZMFd4MENlQkJuNjA
> >>>
> >>> Hmm, the share contains only log files.
> >>> I need a pristine dump of your NAND (created by nanddump without OOB =
data) to analyze the issue.
> >>>
> >>> Thanks,
> >>> //richard
> >>
> >> Sorry Richard, The file name or its extension "dump_mtd7_ecc.log" migh=
t be confusing. but actually this file was created using=20
> >> command "nanddump /dev/mtd7 -f dump_mtd7_ecc.log". This file of size 5=
10MB.
> >>
> >> dump_mtd7_ecc.log MD5SUM 	=3D 5b04c52f992036047d426fa07691429e
> >> 		  SHA256SUM 	=3D 28a36d3fc28c18adc29be66525c1a28e68143937ec43be425ee=
942d3375c17a6
> >>
> >> Please let me know if you have any issue accessing the file.
>=20
> Ahh, .log for a dump file, creative naming. ;-)
>=20
> I had a brief look, the provided dump has more problems.
> The dent node with the bad type is not referenced by the journal,
> so we can ignore it for now.
> The worse problem is that the index references a lot of non-existing
> inodes.
>=20
> Is this a pristine UBIFS with all fixes applied?
> Your kernel is rather old. Not sure if we ever had such an issue,
  Yes, This is pretty much older one provided by chip vendor NXP(Freescale)=
 BSP 3.10.17.
  Last commit id for ubifs is=20

	commit 4791df938fe7aa27a9fe50e4582efd583a045541
	Author: Richard Genoud <richard.genoud@gmail.com>
	Date:   Tue Apr 2 12:24:37 2013 +0200

  Last commit id for ubi is=20

	commit d779146e04aacc8abe8d645284388c837d5d50cd
	Author: Huang Shijie <b32955@freescale.com>
	Date:   Wed Sep 18 10:17:39 2013 +0800=09
=09
=20
> but still...
> Can you please explain a bit more what your device is doing and what
> NAND/UBI layout you are using?
 This is an automotive infotainment system  that has 5 raw partitions for
 u-boot, kernel and recovery software. And there are 3 ubifs partitions for=
=20
	1.  / - (RO) -  896 MB,=20
	2. /var - (RW) - 128 MB,=20
	3. /meta - (RW)- 512 MB.=20

 All of these partition has been through following  commands (in order) for=
=20
 ubifs file system creation during production.
	1. ubiformat
	2. ubimkvol
	3. ubiattach
	4. mount -t ubifs
 A rootfs tar file from yocto build output files  was untar in / and /var p=
artitions.=20


 /meta partition is configured as home folder that has runtime files for=20
 pulseaudio, gstreamer, infotainment radio tuner alignment and radio channe=
l preset.=20
 this partition also has mount point for USB storage device. Where the user=
 can plug=20
 and unplug their USB flash pen drive without umount -ing  it. This is the =
partition=20
 that got corrupted in two units out of 1000 units in vehicles  that has ru=
nning for =20
 last 6 months.

>=20
> Thanks,
> //richard


Cheers
Gnana=
