Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18I8Pb-0004ek-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2002 14:16:03 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C6CB@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: =?iso-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Restart problems after writing to mtdblock?
Date: Sat, 30 Nov 2002 06:46:22 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Power fail is not a concern -- this only occurs in the case of a =
software
reboot of the chip without power loss.  An external reset is not an =
issue.
Flash chips don't store state as to their last read mode across power
failure anyway.

-----Original Message-----
From: J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de]=20
Sent: Wednesday, November 27, 2002 11:39 PM
To: Paul Nash
Cc: linux-mtd@lists.infradead.org
Subject: Re: Restart problems after writing to mtdblock?


On Wed, 27 November 2002 18:33:31 -0800, Paul Nash wrote:
>=20
> Partially answering my question, it looks like I was partly correct.  =

> It appears that MTD is setup to lazily delay a reset to read array=20
> mode until an actual read request comes along.  In my case, this is=20
> fatal.
>=20

Frankly, if the hardware doesn't reset the flash chips on reboot, you =
have
broken hardware and have to deal with it. A reboot_notifier would work,
unless you have a power fail. Not good.

Hacking cfi_cmdset_0001.c to bring the chips back into read mode =
whenever
possible would work better, breaking only on power fail during a write =
or
erase operation. Still not good.

So, unless you want to live with the problem, there is no alternative =
to
fixing the hardware.

J=F6rn
