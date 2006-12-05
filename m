Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrUCA-0003DJ-Ei
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 01:54:29 -0500
Date: Tue, 5 Dec 2006 07:53:40 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Allen Curtis <acurtis@onz.com>
Subject: Re: NAND dump utility?
In-Reply-To: <4a23dd190bc7a153976d88702d6cf3c0@onz.com>
Message-ID: <Pine.LNX.4.64.0612050750400.29536@lnxricardw.se.axis.com>
References: <4a23dd190bc7a153976d88702d6cf3c0@onz.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 4 Dec 2006, Allen Curtis wrote:

> Hello,
>
> Is there a NAND dump utility which will create a binary image suitable=20
> to replication for production? When you create an image with DD you do=20
> not get the ECC information.

In the mtd-utils package there is a utility called nanddump which can dump=
=20
nand flashes with or without ecc.

(mtd-utils can be obtained from=20
ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.0.1.tar.gz)

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
