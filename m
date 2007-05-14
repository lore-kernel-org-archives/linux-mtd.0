Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnV8K-00025f-L3
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 03:38:18 -0400
Date: Mon, 14 May 2007 09:39:23 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: RE: NAND flash write goes wrong
In-Reply-To: <42E999AD7A0E4647BF159F467EE4FBCB017B5155@BLR-SGM-MSG01.wipro.com>
Message-ID: <Pine.LNX.4.64.0705140938250.3951@lnxricardw.se.axis.com>
References: <42E999AD7A0E4647BF159F467EE4FBCB017B5155@BLR-SGM-MSG01.wipro.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: sathish.madhava@wipro.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 14 May 2007, sathish.madhava@wipro.com wrote:

> Dear Ricard
> I have a small question on Yaffs.
> Do we have any utility for creating a Yaffs image as we have it for
> jffs2 ( mkfs.jffs2 from mtd-util2-1.0.0).
>
> In some places I read that to create yaffs, I need to copy the source=20
> files of yaffs into the kernel/fs/yaffs and then build to kernel to get=
=20
> mkyaffs and mkyaffsimage. Is it necessary ? or can I directly create a=20
> yaffs image and then flash it to NAND and give the boot arguments so as=
=20
> to boot it using yaffs image.

I have no experiance of using yaffs. Try the yaffs home page at=20
http://www.aleph1.co.uk/taxonomy/term/31/index.html .

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
