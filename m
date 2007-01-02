Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H1g6A-0007jr-Fu
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 04:38:25 -0500
Subject: OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jan 2007 11:37:57 +0200
Message-Id: <1167730677.20245.14.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <hunter.programmer@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kyungmin,

I do not agree with this patch on your OneNAND tree:
564bdb30743e5a85ede4b9fd0cdb24228d902c37

Also this patch is not good in my opinion:
a75603c07553fdcf87f8c658ccdf0508f3b591cd

We have more OneNAND patches which were not sent yet so I decided to
maintain my own OneNAND tree. As I do not agree with some of your
patches I based it on mtd-2.6.git for now.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
