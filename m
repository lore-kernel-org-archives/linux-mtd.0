Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ih4Jr-00041W-Gl
	for linux-mtd@lists.infradead.org; Sun, 14 Oct 2007 15:19:53 +0100
Subject: Re: delay time of nandsim
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kang-Nyeon Kim <kangnuni@gmail.com>
In-Reply-To: <f5d360820709271917nb156587v5d3f8262abb760ba@mail.gmail.com>
References: <f5d360820709271917nb156587v5d3f8262abb760ba@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sun, 14 Oct 2007 17:16:31 +0300
Message-Id: <1192371391.3455.3.camel@sauron>
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

On Fri, 2007-09-28 at 11:17 +0900, Kang-Nyeon Kim wrote:
> Hi all
>=20
> I found nandsim has delay options like access_delay ( read delay ),
> program_delay( write delay ) and erase_delay.
>=20
> Does it guarantee delay time strictly?

No, this option is not working and should be fixed or kicked out.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
