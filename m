Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jxz1p-0003Dc-9j
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 06:39:25 +0000
Subject: Re: ext2 for read-only file system on UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080519062149.GA16462@cloud.net.au>
References: <20080519062149.GA16462@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 May 2008 09:37:53 +0300
Message-Id: <1211179073.27243.22.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Hamish,

On Mon, 2008-05-19 at 16:21 +1000, Hamish Moffatt wrote:
> My embedded device has a read-only root file system which is only
> replaced by writing a whole image (dd, flashcp, ubiupdatevol etc).
>=20
> Using gluebi and mtdblock, I think I can put a traditional block file
> system (eg ext2) on top of NAND flash. What are the disadvantages of
> this? (For the read-only application only.)

For read-only it should be ok, although I am not sure mtdblock will like
non power of 2 eraseblock sizes. But this should be trivial to fix.

> Background: I've got older hardware which uses ext2 on top of compact
> flash in IDE mode, and new hardware which has replaced the compact flash
> with NAND. I'd like to share an ext2 image between the two if possible.

Should be possible for R/O. Different sizes of eraseblocks may add extra
work though.

> The read-write file systems use ubifs. I'm only considering this for the
> read-only volumes. One obvious disadvantage is lack of compression. Are
> there others? Do I still get the reliability of ubi?=20

No, should be fine. Well, you'll still have WL across whole NAND chip,
yes. You'll still have bit-flip handling.

> ie what does "UBI is not an FTL" mean in practice?

In practice it means that /dev/ubiX_Y are not block devices, where you
may directly put ext2 and the like.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
