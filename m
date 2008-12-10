Received: from mail3.raymarine.com ([213.206.137.1]
	helo=RMUKMAIL.raymarine.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAOs7-0002ci-Se
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:13:00 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Mounting UBIFS fails intermittently
Date: Wed, 10 Dec 2008 13:12:56 -0000
Message-ID: <B8993E4AF7E2B44A80FE742A85665EF00ADA1D73@rmukmail.raymarine.com>
References: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
	<1228913998.13686.275.camel@sauron>
From: "Manish Jain" <Manish.Jain@raymarine.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Artem.

I'll try tests for case 1.

With respect to case2:

Within our flash, we have two partitions. And there is singe image of =
flash contents(namely er.ubi).
We flash our file image using ubiformat command.:

Ubiformat /dev/mtd5 -y -s 512 -f /CFCard/er.ubi

Though this problem is intermittent, but it is more likely to happen =
when we re-format mtd device.

Kind Regards,
Manish



-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: 10 December 2008 13:00
To: Manish Jain
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mounting UBIFS fails intermittently

On Wed, 2008-12-10 at 12:27 +0000, Manish Jain wrote:
> Hello All,
>=20
> In our system , we have created two partition in Nand flash. One is =
mounted as root and the other(which is quite big)is mounted for keeping =
data.
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
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
