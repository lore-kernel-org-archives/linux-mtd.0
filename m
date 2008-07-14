Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KILRg-0006lL-5F
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 10:38:17 +0000
Subject: Re: [ubi][wl] the W/R performance of my wear-leveling unit 2
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215763483.2784.85.camel@localhost.localdomain>
References: <1215763483.2784.85.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Mon, 14 Jul 2008 13:36:46 +0300
Message-Id: <1216031806.29469.10.camel@sauron>
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

Hi.

On Fri, 2008-07-11 at 16:04 +0800, xiaochuan-xu wrote:
> Hi,
>=20
> one other thing forgeted,
> the threshold value is 4096 for current UBI, and 100 for mine
>=20
>=20
> current gives:    |     mine
> --------------------+------------
> real    0m2.279s        0m2.213s
> user    0m0.120s        0m0.176s
> sys     0m0.712s        0m0.660s

Will you please send the new patch? Did you learn how to send
patches inlined? I sent you the description in one of the previous
mails.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
