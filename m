Received: from va-65-40-217-47.sta.embarqhsd.net ([65.40.217.47]
	helo=CVAEX1.VERTICAL.COM)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYttk-0000hk-57
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 21:35:10 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Clobbered file after jffs2 mount
Date: Fri, 21 Sep 2007 21:35:04 -0400
Message-ID: <4DD3AF7ECBBC43409BA36508938D01851B006C@CVAEX1.VERTICAL.COM>
In-Reply-To: <1190417919.7150.180.camel@pmac.infradead.org>
From: "Jon Ringle" <JRingle@vertical.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 21, 2007 19:39, David Woodhouse wrote:
> On Fri, 2007-09-21 at 13:23 -0400, Jon Ringle wrote:
> > I have a jffs2 filesystem on my target (IXP455 processor) running
Linux
> > 2.6.16.29. Sometimes the first time that Linux mounts the jffs2
> > filesystem after reflashing the jffs2 image, sshd would strangely
> > misbehave and not allow incoming connections. After much
> > troubleshooting, it was discovered that the md5sum of the sshd file
was
> > different than the expected md5sum. However, if the system is
rebooted,
> > then sshd works correctly and the md5sum of sshd on the target
magically
> > corrected itself to the expected value.
>=20
> My first inclination is to suspect that somehow the pages of sshd got
> scribbled on in RAM. Is the corruption repeatable?

This is also what I suspect. The corruption is repeatable on the first
boot after a reflash of the jffs2 filesystem about 90% of the time. One
thing that is different on the first boot is that ssh keys get generated
on that first boot.

>=20
> Can you instrument jffs2_read_inode_range() to print a hex dump of the
> "offending" bytes as soon as they've been read?

Thanks David. This information will help further my investigation now
that you've pointed me towards how I can find the sshd image in RAM
pages. I will attach my JTAG debugger when I'm next in the office and
use GDB to extract a dump of the RAM sshd image using a conditional
breakpoint with sshd's inode number in jffs2_read_inode_range(). I will
also try to locate the clobbered bytes so I can put a data breakpoint on
it to see if I can get a backtrace pointing to what is causing the
corruption.
=20
>=20
> Can you boot directly into a shell (init=3D/bin/sh) and then md5sum =
the
> offending file?

I tried init=3D/bin/sh on a first boot after reflash and the md5sum of
sshd was correct. I then rebooted again normally and the ssh keys were
generated. When I logged in, the md5sum of sshd was wrong. The
corruption that I observe is always the same incorrect md5sum.

Jon
