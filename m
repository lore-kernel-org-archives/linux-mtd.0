Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IQiox-0002iS-8R
	for linux-mtd@lists.infradead.org; Thu, 30 Aug 2007 08:08:27 -0400
Date: Thu, 30 Aug 2007 13:51:33 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: Re: transfer jffs2 rootFS to Nand flash
In-Reply-To: <200708301345.36832.schane@osmozis.com>
Message-ID: <Pine.LNX.4.64.0708301348470.4036@lnxricardw.se.axis.com>
References: <200708291610.50617.schane@osmozis.com>
	<Pine.LNX.4.64.0708291639070.4036@lnxricardw.se.axis.com>
	<200708301345.36832.schane@osmozis.com>
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

> Thanks to your analysis and answer. I have removed the --pad option in
> mkfs.jffs2 and then flashed the image using "nandwrite -p /dev/mtdblock1
> cmrootfs.img". This time theres no  "due to bad blocks" error.

Ok, well that's good anyway.

>
> The test on mounting jffs2 image was success once after flashing within t=
he
> running linux as
>
> cm-debian:/mnt/net#mount -t jffs2 /dev/mtdblock1 /mnt/test
> cm-debian:/mnt/net# ls /mnt/test
> =A0bin =A0 dev =A0home =A0 =A0lib =A0 =A0 =A0 =A0 media =A0opt =A0 =A0 =
=A0 =A0 =A0    proc =A0sbin =A0sys =A0usr
> boot =A0etc =A0initrd =A0lost+found =A0mnt =A0 =A0packages.txt =A0root =
=A0srv =A0 tmp =A0var
>
> Indeed, the test of above jffs2 mount after reboot of the system got fail=
ed
> and its a strange.
>
> cm-debian:/mnt/net# mount -t jffs2 /dev/mtdblock1 /mnt/test
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 8, c->nr_blocks 4080
> mount: /dev/mtdblock1: can't read superblock

The "Cowardly refusing to erase blocks on filesystem with no valid JFFS2=20
nodes" indicates to me that what Linux thinks is /dev/mtdblock1 is in fact=
=20
completely erased flash.

> I hope this may explain some hidden stuffs behind the failure of mounting=
 when
> kernel boots. I think it could be the compatibility isseu of the compulab=
 NAND driver and
> the JFFS2. any idea from this behaviour?

The only idea I have is that the device numbers (/dev/mtdblockN) get=20
shifted around for some reason, i.e. you should use /dev/mtdblock0 or 2 or=
=20
something. Can't understand why though.

/Ricard
