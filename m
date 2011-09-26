Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R8A1r-0007vp-5a
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2011 12:11:23 +0000
Date: Mon, 26 Sep 2011 14:11:20 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv6] UBI: new module ubiblk: block layer on top of UBI
In-Reply-To: <1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
Message-ID: <Pine.LNX.4.64.1109261409000.11906@lnxricardw.se.axis.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1316678312-8913-1-git-send-email-david.wagner@free-electrons.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
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
> read-only block devices (named ubiblkX_Y, where X is the UBI device numbe=
r
> and Y the Volume ID).

One thing I'm missing is the ability to specify a volume name on the=20
kernel command line (or when loading the module), i.e. similar to=20
specifying for example root=3Dubi0:rootfs one could be able to specify e.g.=
=20
ubiblk.volume=3D0:rootfs, with rootfs being a volume name.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
