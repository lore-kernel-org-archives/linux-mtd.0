Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R87JY-0003Xo-GQ
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 09:17:29 +0000
Date: Mon, 26 Sep 2011 11:17:22 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv6] UBI: new module ubiblk: block layer on top of UBI
In-Reply-To: <1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
Message-ID: <Pine.LNX.4.64.1109261103590.12195@lnxricardw.se.axis.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-embedded <linux-embedded@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 22 Sep 2011, David Wagner wrote:

> ubiblk is a read-only block layer on top of UBI.  It presents UBI volumes=
 as
> ...

I decided to try this out, as I've been looking for a flexible=20
block-device-on-ubi scheme for using a cramfs or squashfs root file system=
=20
over UBI without having to resort to gluebi (which in its current=20
implementation is too inflexible for my needs).

This can't be considered a complete test, as I basically just booted the=20
system a couple of times, using a cramfs file system residing in an UBI=20
volume. I compiled ubiblk built in to the kernel, not as a module;=20
furthermore, I'm running 2.6.35 for various reasons, so had to backport=20
kstrtoul from 2.6.39 in order to get it to build.

But for what it's worth, it does confirm that it in fact works to set up a=
=20
ubiblk device at boot time for the root filesystem.

There doesn't seem to be a userspace application for attaching/detaching=20
ubiblk devices. I hacked together something based on ubinfo, I could post=
=20
it, but perhaps something more thorough is forthcoming?

A couple of comments below:

> +/**
> + * ubiblk_ctrl_ioctl - ioctl handling for proxying/unproxying a UBI volu=
me
> + *
> + * @file: the file on which the ioctl was invoked (usunsed)
                                                     ^^^^^^^ typo: unused
> + * @cmd: the ioctl type
> + * @arg: additional command informations
> + */
> +static long ubiblk_ctrl_ioctl(struct file *file, unsigned int cmd,
> +                             unsigned long arg)


> +/**
> + * ubiblk_parse_volume_param - parse the "volume" module parameter
> + *
> + * @ubi_num: where to store the UBI device number
> + * @vol_id: where to store the volume ID
> + */
> +static int __init ubiblk_parse_volume_param(int *ubi_num, int *vol_id)
> +{
> +       char *tokens[2] =3D {NULL, NULL};
> +       char buf[VOL_PARAM_MAXLEN];
> +       char *pbuf =3D buf;
> +       int len =3D strlen(buf);
                            ^^^  this needs to be volume, not buf.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
