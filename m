Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C19NQ-0005Jg-DX
	for linux-mtd@lists.infradead.org; Sat, 28 Aug 2004 16:00:43 -0400
Received: from 192.168.69.102 ([69.70.213.145]) by VL-MO-MR011.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0I360007EA9039@VL-MO-MR011.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Sat, 28 Aug 2004 16:00:36 -0400 (EDT)
Date: Sat, 28 Aug 2004 16:00:36 -0400
From: Ccool <ccool@ninjatech.biz>
In-reply-to: <1093595310.21861.18.camel@icampbell-debian>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
Message-id: <200408281600.36216.ccool@ninjatech.biz>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
Content-disposition: inline
References: <200408270210.53632.ccool@ninjatech.biz>
	<1093595310.21861.18.camel@icampbell-debian>
Subject: Re: Trouble with mtd partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 27 Ao=FBt 2004 04:28, Ian Campbell a =E9crit :
> > If it helps (because I surely don't understand what's happenning), it is
> > like if the partition structure in the physmap.c was not taken count of=
f.
>
> The example you said had the contents of the partition structure
> definition surrounded with "#if 0" / "#endif". Perhaps you should change
> that to a 1.
I just tried that, and it did'nt work, I still have:

/ # cat /proc/mtd                                                          =
                                                                           =
 =20
dev:    size   erasesize  name                                             =
                                                                           =
 =20
mtd0: 01000000 00040000 "Physically mapped flash"=20

I would really like it if my mtd1,mtd2, etc partitions were working...

> Also make sure you have the CONFIG_MTD_PARTITIONS turned on in your
> config (and CONFIG_MTD_CMDLINE_PARTS for mtdparts=3D if that's your
> thing).

Yeah, I did that, but I think CONFIG_MTD_CMDLINE_PARTS is giving me some ki=
nd=20
of error.  When I do a "dmesg" I get this message

physmap flash device: 1000000 at ff000000                                  =
                                                                           =
 =20
 Amd/Fujitsu Extended Query Table v1.2 at 0x0040                           =
                                                                           =
 =20
number of CFI chips: 1                                                     =
                                                                           =
 =20
cfi_cmdset_0002: Disabling fast programming due to code brokenness.        =
                                                                           =
 =20
mtd: Giving out device 0 to Physically mapped flash                        =
                                                                           =
 =20
$Id: ftl.c,v 1.45 2003/01/24 23:31:27 dwmw2 Exp $                          =
                                                                           =
 =20
ftl_cs: FTL header not found.                         =20

As you can see, cfi_cmdset_0002 gets itself disable.  I don't know if this =
is=20
the cause of the problem ?!?

My init string is:
Linux/PPC load: console=3DttyS0,9600 nfsroot=3D10.0.0.2:/exports/823_new=20
ip=3D10.0.0.10 root=3D/dev/nfs=20
mtdparts=3Dphysmap:512k(boot)ro,1M(zImage)ro,3M(ramdisk.gz)ro=20

I've read many "how to" to get this right, but this is my "best" result.  I=
=20
really don't know what to do next.  This problem is my main reason for=20
getting on this mailing-list.  If you have an idea, I'm all ears :-)

Thanks
Raphael
