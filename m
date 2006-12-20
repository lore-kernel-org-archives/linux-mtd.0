Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwxDE-0006Lq-FL
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 03:54:11 -0500
Subject: Re: Reduce boot time with jffs2 and CM-X255
From: Artem Bityutskiy <dedekind@infradead.org>
To: Michel LECONTE <michel.leconte@sacet.com>
In-Reply-To: <4588F67A.6080602@sacet.com>
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Dec 2006 10:53:57 +0200
Message-Id: <1166604838.3939.12.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Enrico Migliore <enrico.migliore@fatti.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-12-20 at 09:38 +0100, Michel LECONTE wrote:
> Excuse me for the lack of informations.
>=20
> I use a CM-X255 with a NAND Flash of 512 Mo
> where roughly 250 Mo are used (90 Mo for the native distribution
> provided by Compulab and 160 Mo for specific applications).
>=20
> At the boot, there's a scanning of the MTD1 (4096 blocks) corresponding=20
> to the NAND Flash.
> This scanning takes 1mn20s. The full boot time, from a reset to the=20
> login prompt, takes 4mn.

Are you sure you enable "Summary support"?
What's your kernel version? Newer JFFS2 is quicker.

If you aready use latest JFFS2 and summary is enabled, then I am afraid
you do not have many options - may be improving HW?. 512 MiB is quite
large NAND for JFFS2.

Also, if you are curious, read one of the first chapters of my old JFFS3
document about JFFS2 scalability, it may be helpful to realize JFFS2
issues.=20
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
