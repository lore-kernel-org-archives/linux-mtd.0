Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RG55l-0004US-MJ
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 08:32:10 +0000
Date: Tue, 18 Oct 2011 10:32:07 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Freise, Bjoern-Achim" <bjoern-achim.freise@techem.de>
Subject: Re: Understanding page size in jffs2- and kernel-source
In-Reply-To: <CC01CB1DD69AA74C86C6E8D4EAF42403081C7203@mx-be-2.eu.techem.corp>
Message-ID: <Pine.LNX.4.64.1110181025040.30940@lnxricardw.se.axis.com>
References: <CC01CB1DD69AA74C86C6E8D4EAF42403081C7203@mx-be-2.eu.techem.corp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 17 Oct 2011, Freise, Bjoern-Achim wrote:

> Hello,
>
> we are using Kernel 2.6.28 with mtd-utils 1.0.1 on an ARM at91sam9260=20
> with a NAND flash with 512 byte pages an 16k erase size. And now I'm=20
> trying to understand a few things:
>
> 1) In the kernel source it has PAGE_SIZE and PAGE_CACHE_SIZE with 4096.=
=20
> These defines are used in the jffs2 implementation. Is that correct when=
=20
> using 512 byte pages in a NAND device?

The PAGE_SIZE used in the kernel (4096 in this case) has no relation to=20
the page size of the NAND flash device. The kernel PAGE_SIZE is related
to the memory managment and is usually fixed for a given CPU architecture.

The NAND flash page size is the smallest programmable unit in the flash.

> 2) In our build-environment our image is created with "mkfs.jffs2 ....=20
> --page-size=3D512.... ". I guess this doesn't match with the above?

The page size you specify to mkfs.jffs2 is the size of the flash device.

(Just a note: There are however file systems such as cramfs where the page=
=20
size specified in the kernel is also used when creating the file system.)

> 3) What should I use for a good performance (page_size and/or with/out=20
> compression) when using a large (~ 16MB) sqlite-file?

By performance I assume you mean transfer rate?

I'm not sure about this, but I would expect that it depends on how fast=20
your system's nand flash interface is. With compression on, the system has=
=20
to spend time compressing/decompressing, on the other hand, there is less=
=20
data to be transfered to/from the flash. With compression off, there's=20
more data, but no time has to be spent compressing/decompressing. If you=20
have a fast CPU but slow nand flash interface I would expect compression=20
would be beneficial.

Easiest would be just to try this out.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
