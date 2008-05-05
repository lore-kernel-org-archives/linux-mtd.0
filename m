Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JsvAD-00075s-1l
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 07:31:09 +0000
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080502051655.GA6654@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 May 2008 10:31:12 +0300
Message-Id: <1209972672.3645.8.camel@sauron>
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


On Fri, 2008-05-02 at 15:16 +1000, Hamish Moffatt wrote:
> mkfs.jffs2 and genext2fs both have a -U/--squash-uids switch which make
> them ignore the uid/gids in the directory and set them to 0:0 instead.
>=20
> Here's my implementation for mkfs.ubifs.
>=20
> Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>
>=20

Thanks for the patch. Before applying it, we'd like to know what do you
expect to happen if -U is used simultaneously with the device table
(-D). Should we use what device table says for directories which are
created because they are specified in the device table, or we should use
0 anyway? Or we should just prohibit simultaneous usage of -U and -D ?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
