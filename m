Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiwKA-0005bR-35
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 13:53:46 +0000
Received: from solarwave (pool-141-154-236-33.bos.east.verizon.net
	[141.154.236.33])i0KDpQHK027962
	for <linux-mtd@lists.infradead.org>; Tue, 20 Jan 2004 08:51:27 -0500
From: "Mark Richards" <markr@massmicro.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 20 Jan 2004 08:51:26 -0500
Message-ID: <010301c3df5c$7fdb9c70$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <009a01c3defc$5a0b9820$6e01a8c0@solarwave>
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update... I have also discovered that sometimes the first umount works, =
but
a subsequent umount (preceded of course by a mount) also freezes.  In
addition, I also get an occasional freeze-up when issuing the mount =
command.

If I don't umount at the commandline, but instead call a reboot, the =
file
system umounts fine - question: since I have mounted the MTD manually, =
is it
considered part of the file system to be umounted when the machine shuts
down?

This is more a nuisance, as are the occasional freeze-ups I experience =
just
accessing the DOC once mounted, but since it's a departure from the =
previous
good performance, perhaps it's worth looking into?

Mark Richards


> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of Mark Richards
> Sent: Monday, January 19, 2004 21:23
> To: linux-mtd@lists.infradead.org
> Subject: MTD - DOC 2000 freezes on umount
>=20
> I've been through several good learning experiences getting my =
development
> system set up to work with a DOC 2000 for an embedded project.  I've
> finally
> settled on a RedHat 7.2 distribution and the 2.4.24 kernel.  All =
worked
> well
> with the MTD drivers in several other setups: RedHat 9, Mandrake 9.2, =
but
> for reasons I can't yet fathom, the MTD drivers seem a bit unstable in
> this
> particular kernel.
>=20
> Most frequently when I perform a umount /mnt/doc (doc being the mount
> point)
> the shell session freezes (the umount command does not return a =
prompt).
>=20
> If I then perform a sfdisk -l /dev/nftla the command again goes off =
into
> space with no return data.
>=20
> Then the shut down hangs up.
>=20
> I tried in one kernel build to apply the latest sources to my source =
tree
> using the instructions (and the shell script) but this caused a =
compile
> failure.
>=20
> May I have some suggestions as to how I can further diagnose this =
problem,
> or what I can do to provide information that will help?
>=20
> Many thanks,
>=20
> Mark
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
