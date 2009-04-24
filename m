Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LxReb-0001rR-GL
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 20:05:53 +0000
Date: Fri, 24 Apr 2009 22:05:39 +0200 (CEST)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
To: =?utf-8?Q?Rog=C3=A9rio?= Brito <rbrito@ime.usp.br>
Subject: Re: Regarding the linkstation defconfig
In-Reply-To: <20090424065816.GA15525@ime.usp.br>
Message-ID: <Pine.LNX.4.64.0904242158210.8309@axis700.grange>
References: <20090424065816.GA15525@ime.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Kumar Gala <galak@kernel.crashing.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Apr 2009, Rog=C3=A9rio Brito wrote:

> Hi, Guennadi, Kumar & Co.
>=20
> Guennadi, since you seem to be the one responsible for the
> linkstation/kurobox in the kernel,

That's not howI interpret my role in linkstation development / support.

> I would like to ask you a few things
> that I couldn't quite understand. Please, forgive my ignorance here
> while I ask you some things:
>=20
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
>  01. why is anticipatory the default scheduler for linkstations when CFQ
>      is the default scheduler for the rest of the kernel?
>=20
>  02. since kuroboxes/linkstations are meant to store files, is there any
>      reason why they don't have support for large blk devs enabled by
>      default?
>=20
>  03. why is CONFIG_MIGRATION enabled in such low memory devices?
>=20
>  04. why is CONFIG_BLK_DEV_RAM enabled by default?
>=20
>  05. why is SCSI_LOWLEVEL enabled, if no device under that tree is used?
>=20
>  06. idem for CONFIG_NETDEV_10000.
>=20
>  07. idem for CONFIG_WIRELESS.
>=20
>  08. idem for CONFIG_HWMON.
>=20
>  09. idem for CONFIG_CRYPTO_HW.
>=20
>  10. any reason why CONFIG_VIDEO_OUTPUT_CONTROL is configured as a
>      module?
>=20
>  11. any reason why CIFS is not configured with extended attributes,
>      while both ext3 and nfs are?
>=20
>  12. wouldn't it be a good thing to enable CONFIG_PRINTK_TIME?
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

As I already replied to you earlier, I am not particularly interested in=20
fine-tuning and optimisation of defconfigs. IMHO *_defconfigs are only=20
examples of board configuration, that are known to build and work. The=20
rest is up to the user / packager.

> Perhaps similar remarks would apply to the other device that you
> maintain? I forgot its name.
>=20
> Again, please, forgive my ignorance here regarding the questions above.
> I'm really looking for some clarification and to get things in shape
> both on my systems and in the default kernel configuration, in general.

Feel free to submit patches with reasoning to the powerpc ML and=20
respective maintainer as per MAINTAINERS file.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
