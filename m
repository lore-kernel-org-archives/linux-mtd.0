Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B1PqJ-0005uB-CD
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2004 13:03:19 +0000
To: "Adalbert =?iso-8859-1?q?M=FCller?=" <adalbert.mueller@web.de>
References: <200403111111.i2BBBOQ08193@mailgate5.cinetic.de>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 11 Mar 2004 06:10:29 -0700
In-Reply-To: <200403111111.i2BBBOQ08193@mailgate5.cinetic.de>
Message-ID: <m3r7vzr0l6.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: "Eric W. Biederman" <eric@lnxi.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: ich2rom mapper
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Adalbert M=FCller"  <adalbert.mueller@web.de> writes:

Please don't use html mail...

Please ask general questions on the appropriate mailing list, there
are more people who can answer questions there.

But since I am feeling nice at the moment.


"Adalbert M=FCller" <adalbert.mueller@web.de> writes:

> Hello Mr Biederman,
>=20
> I'm just playing around with your ich2 mapping driver.=20
>=20
> Unfortunatelly after hours of walking through the ich2rom/mtd code
> it's not clear to me why you are adding the additional offsets in
> addr() function.

There is an assumption that you will be using an intel firmware hub
part.  As I recall intel firmware hubs have memory mapped registers
4MB from the address of the flash device.

> Do you have some additional documentation for the driver or do you
> know where to get more informations?=20

developer.intel.com  Look for 82801ab I think is the part number
for the firmware hub code.
=20
> Any help is greatly appreciated.

Welcome.
>=20
> Kind regards,
> Adalbert M=FCller=20


Eric
