Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IyAVr-0000SJ-QR
	for linux-mtd@lists.infradead.org; Fri, 30 Nov 2007 18:23:02 +0000
Subject: Re: file system tests (fs-tests)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ram <vshrirama@gmail.com>
In-Reply-To: <8bf247760711300748q269a0d9i15b08461ef394525@mail.gmail.com>
References: <8bf247760711300748q269a0d9i15b08461ef394525@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 30 Nov 2007 20:22:43 +0200
Message-Id: <1196446963.20132.10.camel@sauron>
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

On Fri, 2007-11-30 at 21:18 +0530, Ram wrote:
> Hi,
>   I am trying to test my nand drivers using the fs-tests package found
> on mtd utils git tree.
>=20
>   My test area (JFFS2 partition size) is 8MB.
>=20
>   Most of the tests have passed. However some of the tests take too much =
time
>   to complete.
>   The test "rndrm00" takes over 2 hours to complete.
>   The test "stress00.sh" has taken 4 hours to complete.
>=20
>   When i run stress00.sh - The system becomes too slow. commands like
>   df -h and ps -l take too much time to execute.
>=20
>   However, I have not seen any JFFS2 errors when i ran these tests.
>=20
>   Is something wrong? Worried about the time taken by these tests.
>=20
>   Is this normal?.

Its fine, they just torture the FS a lot. Look inside the scripts and
change the iteration counts if you want to make them pass faster.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
