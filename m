Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFDZw-0004OW-FM
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 13:01:07 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l18HwGhf017402
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 19:58:36 +0200
Subject: Re: OneNAND test modules
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45CB3F4C.8080001@nokia.com>
References: <45CB3F4C.8080001@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 08 Feb 2007 20:00:59 +0200
Message-Id: <1170957660.10670.4.camel@sauron>
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

On Thu, 2007-02-08 at 17:18 +0200, Adrian Hunter wrote:
> There are 4 test modules in users/ahunter/nand-tests.git
> that I have found useful for testing OneNAND.  They are:
>=20
> oobtest		Test reading and writing oob with auto-placement
> pagetest	Test reading and writing some pages
> subpagetest	Test reading and writing some sub-pages
> torture		Artem's torture test (here at Artem's request)

Err, surely they are not OneNAND-only and may be used to test NAND stuff
as well?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
