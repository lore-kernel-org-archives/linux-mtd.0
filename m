Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aila2-0003uO-ND
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 02:25:26 +0000
Received: from solarwave (pool-141-154-236-33.bos.east.verizon.net
	[141.154.236.33])i0K2N9HK020793
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2004 21:23:09 -0500
From: "Mark Richards" <markr@massmicro.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 19 Jan 2004 21:23:11 -0500
Message-ID: <009a01c3defc$5a0b9820$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been through several good learning experiences getting my =
development
system set up to work with a DOC 2000 for an embedded project.  I've =
finally
settled on a RedHat 7.2 distribution and the 2.4.24 kernel.  All worked =
well
with the MTD drivers in several other setups: RedHat 9, Mandrake 9.2, =
but
for reasons I can't yet fathom, the MTD drivers seem a bit unstable in =
this
particular kernel.

Most frequently when I perform a umount /mnt/doc (doc being the mount =
point)
the shell session freezes (the umount command does not return a prompt).

If I then perform a sfdisk -l /dev/nftla the command again goes off into
space with no return data.

Then the shut down hangs up.

I tried in one kernel build to apply the latest sources to my source =
tree
using the instructions (and the shell script) but this caused a compile
failure. =20

May I have some suggestions as to how I can further diagnose this =
problem,
or what I can do to provide information that will help?

Many thanks,

Mark
