Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD1YW-0003wE-EQ
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 11:46:35 -0500
Subject: RE: [RFC] [PATCH take 2] JFFS2: use MTD_OOB_AUTO
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <004301c74670$60a0a250$c7a3580a@swcenter.sec.samsung.co.kr>
References: <20070201075719.15000.50015.sendpatchset@localhost.localdomain>
	<004301c74670$60a0a250$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Fri, 02 Feb 2007 18:46:15 +0200
Message-Id: <1170434775.3628.22.camel@sauron>
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

> Looks good, how about make it const?
Ok.

> Why we compare it with character pointer? just use memcmp
Ok, thanks

I'll send updated patch. We've tested it with our device - works like a
charm. May you please try it on NAND and confirm it is OK?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
