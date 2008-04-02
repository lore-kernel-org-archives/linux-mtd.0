Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jh3OY-0008CN-0R
	for linux-mtd@lists.infradead.org; Wed, 02 Apr 2008 13:52:54 +0000
Subject: Re: mkfs.ubifs: device table support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080328062402.GA31782@cloud.net.au>
References: <20080328062402.GA31782@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Wed, 02 Apr 2008 16:46:31 +0300
Message-Id: <1207143991.3856.86.camel@sauron>
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

Hi Hamish,

On Fri, 2008-03-28 at 17:24 +1100, Hamish Moffatt wrote:
> Are there any plans to add support for a device table in mkfs.ubifs,
> similar to mkfs.jffs2, genext2fs etc?
>=20
> Otherwise the image must be made as root or using fakeroot I think.

This is now implemented. Update your mkfs.ubifs and, enjoy.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
