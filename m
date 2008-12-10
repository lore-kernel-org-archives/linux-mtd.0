Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAOhl-0007wp-Pi
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:02:18 +0000
Subject: Re: Mounting UBIFS fails intermittently
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manish Jain <Manish.Jain@raymarine.com>
In-Reply-To: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
References: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 14:59:58 +0200
Message-Id: <1228913998.13686.275.camel@sauron>
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

On Wed, 2008-12-10 at 12:27 +0000, Manish Jain wrote:
> Hello All,
>=20
> In our system , we have created two partition in Nand flash. One is mount=
ed as root and the other(which is quite big)is mounted for keeping data.
> The problem is that data mount fails intermittently.
>=20
> Here is the kernel error log, when we try to mount ubifs.

I saw huge amount of e-mails like this, but for JFFS2. In most of the
cases the reporters had one of:
1. flash problems - the driver or HW was broken
2. flashed images incorrectly

Please, check these 2 cases. To check the first ones, please use
mtd-tests git repository:
git://git.infradead.org/users/dedekind/mtd-tests-2.6.git
(http://git.infradead.org/users/dedekind/mtd-tests-2.6.git)

The tests are not in main-line so far, so you have to take the 8 patches
from the above git tree, apply them to your tree, enable the tests and
compile.

The tests are kernel modules. Please, make sure they work without errors
for you. Note, be careful with the torture test - either do not run it
or realize what it is doing before running.

Vs. the second possible issue - just describe how you flash your UBIFS
image to your "data" partition, if you do this at all.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
