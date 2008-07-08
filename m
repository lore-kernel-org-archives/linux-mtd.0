Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KG9FL-0000c6-QY
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 09:12:28 +0000
Subject: Re: About UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Qiang Wang <rurality.linux@gmail.com>
In-Reply-To: <71413c850807080208h26a5d452x4eb705a5133838c4@mail.gmail.com>
References: <71413c850807080208h26a5d452x4eb705a5133838c4@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Jul 2008 12:08:51 +0300
Message-Id: <1215508131.14618.7.camel@sauron>
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


On Tue, 2008-07-08 at 18:08 +0900, Qiang Wang wrote:
> hello, every body
> I am a newbie here.
> I want to try UBIFS , and want to study it.
>=20
> So , here is my first question.
> how to download the
> git://git.infradead.org/~dedekind/ubi-2.6.git
> I try the
> git fetch git://git.infradead.org/~dedekind/ubi-2.6.git
> but got the error message as below
> fatal: Not a git repository
> Failed to find a valid git directory.

It is very similar to what is described here:

http://www.linux-mtd.infradead.org/source.html


git-clone --reference linux-2.6
git://git.infradead.org/~dedekind/ubi-2.6.git

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
