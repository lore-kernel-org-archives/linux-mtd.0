Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KcaYS-0007hG-Bf
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 06:48:56 +0000
Subject: Re: [PATCH 1/6] [MTD-UTILS] nanddump: Qualifier Clean-up
From: Artem Bityutskiy <dedekind@infradead.org>
To: Grant Erickson <gerickson@nuovations.com>
In-Reply-To: <1220856321-22712-1-git-send-email-gerickson@nuovations.com>
References: <1220856321-22712-1-git-send-email-gerickson@nuovations.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Sep 2008 09:48:53 +0300
Message-Id: <1220856533.4036.50.camel@sauron>
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

On Sun, 2008-09-07 at 23:45 -0700, Grant Erickson wrote:
> Static-qualified all globals except 'main' because they have no use
> beyond file scope.
> Constant-qualified MTD device and input positional parameter globals.
> Constant-qualified argv array.
>=20
> Signed-off-by: Grant Erickson <gerickson@nuovations.com>

Ack for whole series.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
