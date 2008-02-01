Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKqEt-0006Ix-UM
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 07:23:14 +0000
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m117MtBS032098
	for <linux-mtd@lists.infradead.org>; Fri, 1 Feb 2008 09:23:02 +0200
Subject: Re: [PATCH][MTD-UTILS] ubi-tools: fix ubinize
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <47A1E795.5010407@nokia.com>
References: <47A1E795.5010407@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Feb 2008 09:22:26 +0200
Message-Id: <1201850546.23305.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-01-31 at 17:21 +0200, Adrian Hunter wrote:
> ubinize reserves 2 eraseblocks for the volume table at the start of the
> output file and then never seeked back to the start of the file.
>=20
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Pushed, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
