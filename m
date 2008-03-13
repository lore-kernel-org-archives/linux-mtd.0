Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JZmqk-00029w-Hn
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 12:47:59 +0000
Date: Thu, 13 Mar 2008 13:47:41 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Manuel Sahm <Manuel.Sahm@feig.de>
Subject: Re: Binary Nandwrite/read to Flash
In-Reply-To: <47D91B98.20001@feig.de>
Message-ID: <Pine.LNX.4.64.0803131345580.6032@lnxricardw.se.axis.com>
References: <47D91B98.20001@feig.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
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


On Thu, 13 Mar 2008, Manuel Sahm wrote:

> Hello,
>
> is it possible to write directly to nandflash, or to store a file in=20
> nand flash ?

Yes, use the mtdtools applications nandwrite and nanddump in order to skip=
=20
bad blocks during read and write. You'll need the pad option to nandwrite=
=20
in order to fill out to an even multiple of the page size.

If you're writing a file, it really is raw byte by byte, with no=20
indication of file size, access times etc, so to the extent you need that=
=20
info you'll have to store it explicitly.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
