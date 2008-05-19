Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy0Df-00014b-7B
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 07:55:43 +0000
Subject: Re: ext2 for read-only file system on UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080519074403.GA17911@cloud.net.au>
References: <20080519062149.GA16462@cloud.net.au>
	<1211179073.27243.22.camel@sauron>
	<20080519065623.GA17246@cloud.net.au>
	<1211180904.27243.27.camel@sauron>
	<20080519074403.GA17911@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 May 2008 10:54:23 +0300
Message-Id: <1211183663.27243.32.camel@sauron>
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

On Mon, 2008-05-19 at 17:44 +1000, Hamish Moffatt wrote:
> > Yes, her layer is assumed to be R/W block device.
> >=20
> > You could want to glance here as well:
> >=20
> > http://www.linux-mtd.infradead.org/faq/general.html#L_ext2_mtd
> > http://www.linux-mtd.infradead.org/faq/ubi.html#L_ext2_over_ubi
>=20
> Thanks for the links. So, read-write with mtdblock is dangerous
> (regardless of UBI) because it must erase and rewrite a whole block,
> right?

Yes, and you loose plenty of data in case of power-cuts.

>  Proposed ubiblk (linked from above) would use UBI ops to make the
> update operation safe.

I have not looked that close at Nancy's patches because I did not like
her unreasonable copy-paste stuff. But I assume she would do something
like I proposed here:

http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
