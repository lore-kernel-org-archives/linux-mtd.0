Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwJtb-0006Tz-2W
	for linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 09:55:17 -0500
Subject: Re: [PATCH] UBI: fix errorhandling in ioctl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200612181357.35365.alexs@linux.vnet.ibm.com>
References: <200612181357.35365.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Dec 2006 16:16:20 +0200
Message-Id: <1166451380.18628.79.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org," <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Alexander,

On Mon, 2006-12-18 at 13:57 +0100, Alexander Schmidt wrote:
> the double declaration of "int err" makes the ioctl() for resizing volume=
s
> always return 0, even if errors occured during the resizing procedure.
>=20

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
