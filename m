Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBQ2Q-0007oM-M2
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 03:03:05 -0400
Subject: Re: [RFC] sysfs support for mtd
From: Artem Bityutskiy <dedekind@infradead.org>
To: Siddharth Choudhuri <siddh_c@yahoo.com>
In-Reply-To: <470958.35224.qm@web30213.mail.mud.yahoo.com>
References: <470958.35224.qm@web30213.mail.mud.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 19 Jul 2007 10:02:52 +0300
Message-Id: <1184828572.3531.183.camel@sauron>
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

On Wed, 2007-07-18 at 11:45 -0700, Siddharth Choudhuri wrote:
> Here's the design:
> o Each mtd partition appears as a directory under=20
> /sys/devices/mtd/=20
> o The following fields from struct mtd_info are
> exported as files - eccsize, ecctype, erasesize,
> numeraseregions, oobsize, size, type, writesize.
I doubt OOB-related stuff has to be exposed. We see many new flash
controllers which do not let you access OOB. It is better to avoid OOB
usage altogether, so I would not even exposed that stuff in sysfs.


> I would like to get some suggestions from the group
> before sending out a patch:
> o Currently the fields type, ecctype are integers.
> Should these be converted into appropriate strings as
> per #defines from mtd-abi.h
> Eg: cat /sys/devices/mtd/mtd0/type=20
> shows 4. Should this show MTD_NANDFLASH instead ?
I think yes, it should be something like "NAND", "OneNAND", "NOR",
"DataFlash", etc.

> o I am not sure where an additional link from bus to
> mtd should be added in the sysfs hierarchy. Should it
> be /sys/bus/platform/devices -> ../../../devices/mtd
> -OR-
> /sys/bus/platform/ -> ../../devices/mtd=20
No idea, but I've always thought sysfs core automatically puts these
links. All you have to do is to define your bus object which is
"platform" bus, and the stuff will appear. Although I am not sure.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
