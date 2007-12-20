Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5GGg-0001uZ-5e
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 07:56:40 +0000
Date: Thu, 20 Dec 2007 08:55:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Tallam, Sreenivas" <Sreenivas.Tallam@netapp.com>
Subject: Re: JFFS2 Utility?
In-Reply-To: <8B3BF7A02B910640AB146A919AB3659404DE887A@exsvl03.hq.netapp.com>
Message-ID: <Pine.LNX.4.64.0712200850240.21948@lnxricardw.se.axis.com>
References: <8B3BF7A02B910640AB146A919AB3659404DE887A@exsvl03.hq.netapp.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 19 Dec 2007, Tallam, Sreenivas wrote:

> Hi All,
>
> I am newbie in JFFS2 file system topic, was wondering if there was a
> latest mkfs.jffs2 binary for the 2.6.10 and above kernels that I can
> download from?
> Or do I need check out the source tree for this? If the source tree
> needs to be pulled out, where can I get and where do I get instructions
> for building a mkfs.jffs2 image.

It is not difficult to build from source. A tarball of the source can be=20
found here:

ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.1.0.tar.bz2

Download, unpack, and do 'make' to build them.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
