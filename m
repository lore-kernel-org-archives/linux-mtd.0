Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JxzVF-0005Vp-JB
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 07:09:50 +0000
Subject: Re: ext2 for read-only file system on UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080519065623.GA17246@cloud.net.au>
References: <20080519062149.GA16462@cloud.net.au>
	<1211179073.27243.22.camel@sauron>
	<20080519065623.GA17246@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 May 2008 10:08:24 +0300
Message-Id: <1211180904.27243.27.camel@sauron>
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

On Mon, 2008-05-19 at 16:56 +1000, Hamish Moffatt wrote:
> > No, should be fine. Well, you'll still have WL across whole NAND chip,
> > yes. You'll still have bit-flip handling.
>=20
> So, is there a benefit to Nancy's proposed ubi block layer as opposed to
> gluebi + mtdblock?
> ( http://lists.infradead.org/pipermail/linux-mtd/2008-May/021609.html )

Yes, her layer is assumed to be R/W block device.

You could want to glance here as well:

http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd
http://www.linux-mtd.infradead.org/faq/ubi.html#L_ext2_over_ubi

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
