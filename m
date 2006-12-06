Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Grvhn-0002cR-FS
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 07:16:56 -0500
Subject: Re: Finding flash type...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Siddharth Choudhuri <siddh_c@yahoo.com>
In-Reply-To: <1165370753.2679.5.camel@crusty.rchland.ibm.com>
References: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
	<1165370753.2679.5.camel@crusty.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Dec 2006 13:57:52 +0200
Message-Id: <1165406272.20337.46.camel@sauron>
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

On Tue, 2006-12-05 at 20:05 -0600, Josh Boyer wrote:
> > 1. Should the information be exported in the
> > /sys/block/mtd* directory ? The other place would be
> > /sys/class/mtd*.
>=20

I am unsure it is /sys/class/. For MTD devices we should probably have
full device/driver/bus support so it'll go
at /sys/devices, /sys/drivers/, /sys/bus. In case of MTD the bus is so
called "platform" bus. Please, refer to linux device drivers v3.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
