Received: from mgw-ext03.nokia.com ([131.228.20.95])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq3fh-0008NJ-6i
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 03:23:18 -0500
Subject: Re: Finding flash type...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Siddharth Choudhuri <siddh_c@yahoo.com>
In-Reply-To: <20061129185335.89361.qmail@web30205.mail.mud.yahoo.com>
References: <20061129185335.89361.qmail@web30205.mail.mud.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 10:22:31 +0200
Message-Id: <1164961351.576.84.camel@sauron>
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

On Wed, 2006-11-29 at 10:53 -0800, Siddharth Choudhuri wrote:
> Hi,
>=20
> Is it possible to know what kind of flash (NOR type or
> NAND type) is installed on a system ? (may be using
> lsmod -or- cat /proc/ksyms | grep ? )=20

It would be ideal if somebody added sysfs support to MTD. Then you could
just look at sysfs and find it out. Now you should use ioctl's.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
