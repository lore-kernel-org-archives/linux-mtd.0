Received: from smtp4-g19.free.fr ([212.27.42.30])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQmQW-0005F1-Ev
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 11:59:28 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id A00106F3DD
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Aug 2007 17:59:21 +0200 (CEST)
Received: from [192.168.111.252] (cla34-1-88-160-215-156.fbx.proxad.net
	[88.160.215.156])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 827CF6F1DE
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Aug 2007 17:59:21 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: transfer jffs2 rootFS to Nand flash
Date: Thu, 30 Aug 2007 17:58:55 +0200
References: <200708291610.50617.schane@osmozis.com>
	<200708301655.54224.schane@osmozis.com>
	<Pine.LNX.4.64.0708301708240.4036@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0708301708240.4036@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200708301758.56358.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I got my problem fix up by gurus. The work around solution to transfer jffs=
2=20
rootfs on the cm-x270 nand ( /dev/mtdblock1 ) is to have the following=20
kernel configuration setup.

CONFIG_ARMCORE_FLASH is not set
CONFIG_ARMCORE_NAND is not set     =20
CONFIG_MTD_NAND_CM_X270 is set

The "compulab Nand flash" block driver CONFIG_ARMCORE_NAND initializes=20
(erases) nand contents on each reboot that causes the jffs2 rootfs mounting=
=20
failure.=20

Unconfig CONFIG_ARMCORE_NAND fixs the problem and the jffs2 rootfs on the=20
cm-x270 nand mounted succesfully.

IP-Config: Complete:
      device=3Deth0, addr=3D192.168.6.203, mask=3D255.255.255.0, gw=3D192.1=
68.6.1,
     host=3Dcm-x270, domain=3D, nis-domain=3D(none),
     bootserver=3D192.168.6.1, rootserver=3D192.168.6.1, rootpath=3D
VFS: Mounted root (jffs2 filesystem).
=46reeing init memory: 120K

Regards,
Sara



Le Jeudi 30 Ao=FBt 2007 17:09, vous avez =E9crit=A0:
> On Thu, 30 Aug 2007, Saravanan Chanemouganandam wrote:
> > I have unconfigured the compulab NAND flash block driver which
> > reinitialise (erases on reboot) each and everytime of reboot that
> > conflicts with MTD nand driver.
>
> That would definitely explain the symptoms you were seeing (no jffs2 nodes
> found when mounting the rootfs).
>
> > This fixed my problem and I can be able to successfully mount the jffs2
> > rootfs.
> >
> > IP-Config: Complete:
> >      device=3Deth0, addr=3D192.168.6.202, mask=3D255.255.255.0, gw=3D19=
2.168.6.1,
> >     host=3Dcm-x270, domain=3D, nis-domain=3D(none),
> >     bootserver=3D192.168.6.1, rootserver=3D192.168.6.1, rootpath=3D
> > VFS: Mounted root (jffs2 filesystem).
> > Freeing init memory: 120K
> > INIT: version 2.86 booting
> >
> > Thanks a lot for your comments and your valuable time.
>
> Great!
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
