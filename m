Received: from zmamail03.zma.compaq.com ([161.114.64.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ByvK-0005RN-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2002 14:55:23 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: cmdline.c file name collision
Date: Wed, 13 Nov 2002 10:25:44 -0500
Message-ID: <D99C1FB421989A40818B6370E3187094040A3AB6@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@hp.com>
To: "Scott Anderson" <scott_anderson@mvista.com>,
	<linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


> -----Original Message-----
> From: Scott Anderson [mailto:scott_anderson@mvista.com]
> Sent: Tuesday, November 12, 2002 12:47 PM
> To: linux-mtd@lists.infradead.org
> Subject: cmdline.c file name collision
>=20
>=20
> Hi all,
>=20
> I recently noticed that when CONFIG_MODVERSIONS is turned on, both
> drivers/mtd/cmdline.c and lib/cmdline.c are trying to store their
> symbol versions in include/linux/modules/cmdline.ver in a 2.4 kernel
> tree.  Only one of them "wins" leaving the versioned symbols of the
> other undefined.  It seems to me that drivers/mtd/cmdline.c should
> probably be renamed to avoid the conflict.  Thoughts?
>=20

hmm.  My first thought was to rename drivers/mtd/cmdline.c to =
drivers/mtd/mtdcmdline.c or drivers/mtd/cmdlinepart.c.

Actually, that was my second thought.  My first thought was to wonder =
why CONFIG_MODVERSIONS flattens the kernel source file namespace.  I =
just turned on CONFIG_MODVERSIONS to build an ipaq kernel, and I find I =
also have a name conflict on arch/arm/mach-sa1100/pm.c and kernel/pm.c.

Jamey
