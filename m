Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IfsQq-0002Bt-9n
	for linux-mtd@lists.infradead.org; Thu, 11 Oct 2007 08:26:10 +0100
Subject: Re: mtd support for large NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <200710110911.58596.manningc2@actrix.gen.nz>
References: <200710110911.58596.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Oct 2007 10:22:41 +0300
Message-Id: <1192087361.21337.3.camel@sauron>
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

On Thu, 2007-10-11 at 09:11 +1300, Charles Manning wrote:
> Last I looked (2.6.23), mtd_info is limited by a u32 size field to 4Gbyte=
s of=20
> flash. That's no longer very large and is limiting some applications.
>=20
> Is anyone working on this?

Yeah, the problem is known, but nobody is working on the fix AFAIK.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
