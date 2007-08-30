Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IQleG-0004gW-Ns
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 11:09:36 -0400
Date: Thu, 30 Aug 2007 17:09:16 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: transfer jffs2 rootFS to Nand flash
In-Reply-To: <200708301655.54224.schane@osmozis.com>
Message-ID: <Pine.LNX.4.64.0708301708240.4036@lnxricardw.se.axis.com>
References: <200708291610.50617.schane@osmozis.com>
	<200708301345.36832.schane@osmozis.com>
	<Pine.LNX.4.64.0708301348470.4036@lnxricardw.se.axis.com>
	<200708301655.54224.schane@osmozis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 30 Aug 2007, Saravanan Chanemouganandam wrote:

> I have unconfigured the compulab NAND flash block driver which reinitiali=
se
> (erases on reboot) each and everytime of reboot that conflicts with MTD n=
and
> driver.

That would definitely explain the symptoms you were seeing (no jffs2 nodes=
=20
found when mounting the rootfs).

>
> This fixed my problem and I can be able to successfully mount the jffs2
> rootfs.
>
> IP-Config: Complete:
>      device=3Deth0, addr=3D192.168.6.202, mask=3D255.255.255.0, gw=3D192.=
168.6.1,
>     host=3Dcm-x270, domain=3D, nis-domain=3D(none),
>     bootserver=3D192.168.6.1, rootserver=3D192.168.6.1, rootpath=3D
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 120K
> INIT: version 2.86 booting
>
> Thanks a lot for your comments and your valuable time.

Great!

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
