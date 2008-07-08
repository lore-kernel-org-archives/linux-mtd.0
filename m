Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KG8V3-0008AH-7L
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 08:24:37 +0000
Subject: Re: [UBI][WL][PATCH] Rewrite the UBI wear-leveling unit and
	Implemented two-dimension(PEB ec, LEB temp) wear leveling algorithm.
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1215504853.2801.5.camel@localhost.localdomain>
References: <1215504853.2801.5.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Jul 2008 11:20:58 +0300
Message-Id: <1215505258.14618.4.camel@sauron>
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

On Tue, 2008-07-08 at 16:14 +0800, xiaochuan-xu wrote:
> I've finished the two-dimension wear-leveling algorithm.

How about more details?

> which is good enough for not only wear-leveling but also=20
> reduce unnecessary erasure among the wear-leveling process=20
> as soon as possible,due to the two-dimension(PEB erase counter,=20
> LEB temperature) wear leveling algorithm.=20
>=20
> It's too long to send the diff in the mail-list.

How long?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
