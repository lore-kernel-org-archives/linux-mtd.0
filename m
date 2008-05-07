Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jtp4D-0003jx-9r
	for linux-mtd@lists.infradead.org; Wed, 07 May 2008 19:12:41 +0000
Date: Wed, 7 May 2008 21:12:26 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Manu Rao <MRao@AlienTechnology.com>
Subject: Re: mkfs.jffs2 question
In-Reply-To: <32C4C619DF66B945B608E59A6791C8C30265E5DB@CBA0E2K11.CBA0.centerbeam.com>
Message-ID: <Pine.LNX.4.64.0805072111020.3888@lnxricardw.se.axis.com>
References: <32C4C619DF66B945B608E59A6791C8C30265E5DB@CBA0E2K11.CBA0.centerbeam.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 7 May 2008, Manu Rao wrote:

> Trivial question - Does the pagesize option in mkfs.jffs2 refer to the
> NAND hardware page size, or the jffs2 page size?

I believe it is actually supposed to be the (target) system page size =3D=
=20
PAGE_SIZE, i.e. 4 KiB for most systems.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
