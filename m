Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkiiP-0003DR-IX
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 09:59:51 -0500
Subject: Re: Problem with copying more than 2kb file into the flash
From: Artem Bityutskiy <dedekind@infradead.org>
To: "s.balamurugan" <s.balamurugan@gdatech.co.in>
In-Reply-To: <455C7650.2000705@gdatech.co.in>
References: <455C7650.2000705@gdatech.co.in>
Content-Type: text/plain; charset=utf-8
Date: Thu, 16 Nov 2006 16:38:49 +0200
Message-Id: <1163687929.5597.18.camel@sauron>
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

On Thu, 2006-11-16 at 20:01 +0530, s.balamurugan wrote:
> Upon remounting, the file is lost or showing a size of 0.  Upon scanning =
the
> flash at mount I will always get "jffs2_get_inode_nodes(): Data CRC faile=
d
> on node at ..." =20
>=20
>             I don't know where is the problem either in my nand driver or=
 jffs2 code
>=20
> Has anyone experienced this and have any ideas?  Any help would be much
> appreciated.

I would start from making sure the that your flash driver is all right.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
