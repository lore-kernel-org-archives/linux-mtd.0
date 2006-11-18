Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GlPZ3-0005Co-7L
	for linux-mtd@lists.infradead.org; Sat, 18 Nov 2006 07:45:02 -0500
Subject: Re: compression tests in jffs2
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Mat=EDas_Zabalj=E1uregui?= <matiasz@info.unlp.edu.ar>
In-Reply-To: <20061117190637.2fgiinwlz4wswso0@ada.info.unlp.edu.ar>
References: <20061117190637.2fgiinwlz4wswso0@ada.info.unlp.edu.ar>
Content-Type: text/plain; charset=utf-8
Date: Sat, 18 Nov 2006 14:44:39 +0200
Message-Id: <1163853879.5597.54.camel@sauron>
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

Hi Mat=C3=ADas,

On Fri, 2006-11-17 at 19:06 -0300, Mat=C3=ADas Zabalj=C3=A1uregui wrote:
> Hello, I'm interested in doing some tests on jffs2 compression =20
> algorithms (CPU, RAM, and compression ratio), and I've two questions:

sounds promising!

> - recompiling the jffs2 module is the only way to reconfigure the =20
> compression behaviour?

Yes at the moment. But adding dynamic and per-file compression so would
cool.

> - Is there any documentation about using comprtest.c ?

Unfortunately no. There are not a lot of JFFS2 documentation. You'll
need to dig the sources which are somewhat not very easy to dig. Feel
free to ask questions.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
