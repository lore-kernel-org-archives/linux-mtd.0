Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SV7FF-0008Cu-8Z
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 20:24:21 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS and NAND issue (works only once)
Date: Thu, 17 May 2012 16:23:51 -0400
Message-ID: <5D308BD40154E4439D82454FE483A50206B70031@EVS4.nam.ci.root>
In-Reply-To: <5D308BD40154E4439D82454FE483A50206B6FFDD@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A50206B6FFDD@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nevermind.  Please ignore, and the top post.

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Bishop, Mark
> Sent: Thursday, May 17, 2012 4:08 PM
> To: linux-mtd@lists.infradead.org
> Subject: UBIFS and NAND issue (works only once)
>=20
> I do this:
> mkfs.ubifs -r filesystem -m 2048 -e 129024 -c 1012 -o ubifs.img
> ubinize -o ubi.img -m 2048 -p 128KiB -s 512 ubinize.cfg
> .....
> In uboot I flash the image:
> tftp .....
> nand erase .....
> nand write....
>=20

<long debug messages that wasn't required when you erase the proper
sizes of flash>
