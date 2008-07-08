Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KG8TR-0004rS-4u
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 08:22:57 +0000
Subject: Re: problem of UBI debug info printing
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215401158.3218.2.camel@localhost.localdomain>
References: <1215401158.3218.2.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Jul 2008 11:18:50 +0300
Message-Id: <1215505130.14618.0.camel@sauron>
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

Hi,

On Mon, 2008-07-07 at 11:25 +0800, xiaochuan-xu wrote:
> Hello,
>=20
> No debug message about UBI's WL unit can be found in
> /var/log/dmesg file in my 2.6.26-rc5-01191-g23baa5b-dirty kernel.=20
> I don't why? I need you help. thanks in advance.=20

try to use dmesg utility instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
