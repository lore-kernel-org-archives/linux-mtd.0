Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J53fL-0001rf-Id
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 18:29:17 +0000
Subject: Re: [PATCH 1/5] UBI: add UBI control device
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712191651.10608.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191512.00951.arnd@arndb.de> <1198074693.18962.59.camel@sauron>
	<200712191651.10608.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Dec 2007 20:12:13 +0200
Message-Id: <1198087933.18962.124.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-12-19 at 16:51 +0100, Arnd Bergmann wrote:
> A major number gives you a space of 2**32 devices, where you would only
> need a single device.=20
> If you just call misc_register(), you get the exact same semantics for
> /dev/ubi_ctrl, but need less code.

Err, this is not really appropriate - it registers my device under
"misc" class...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
