Received: from eeout.etn.com ([63.67.43.145] helo=pitpashub01.nasa.ad.etn.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyVzq-0006X0-Ng
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 09:05:43 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Feb 2005 09:05:40 -0500
Message-ID: <F0A064EBC8C91C449244D108367426DC01EF2AAD@ra1ncsmb01.nasa.ad.etn.com>
From: "Creech, Matthew" <MattCreech@eaton.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 on dataflash problem [fixed]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Creech, Matthew wrote:
> I have an embedded device based on Atmel's AT91RM9200DK board, which
is
> using serial dataflash (AT45DB642).  I've allocated a JFFS2 partition
to
> store non-volatile data.  In testing I stumbled across a particular
> problem that only occurs after heavy hammering on our device, but is
> fairly consistent in how and when it occurs.  The pattern has been
> narrowed down so that a script doing something like this:    =20
>=20
> while [ 1 ]; do
>    cp /mnt/jffs2/$RANDOM_FILE /mnt/jffs2/$BLAH
>    # File size has been tested between 8K and 64K
> done
>=20
> makes the problem occur within 24 to 36 hours.  So something about
> copying one file over another one breaks things.  The "problem" here
is
> that every I/O operation having to do with the JFFS2 partition blocks
> indefinitely.  For example, after running the test for 2 days, you can
> log into the device and try to "ls" the contents of /mnt/jffs2, and
your
> shell will hang.  You can then login on another terminal, but you'll
get
> another hang if you try to have any interaction with the JFFS2
partition.
> So everything else seems to function normally, but JFFS2 just dies.
Also
> note that rebooting the device sometimes fixes things right up (JFFS2
> mounts fine and works properly as if nothing happened at all), but
> sometimes the filesystem image is corrupt and refuses to mount.

>=20
[snip]

For anyone interested, Andrew Victor pointed me to these two patches:

http://lists.infradead.org/pipermail/linux-mtd/2005-February/011766.html
http://lists.infradead.org/pipermail/linux-mtd/2005-February/011767.html

which I applied to a kernel with a recent MTD snapshot patched in.  The
test which had consistently crashed my device within 24-36 hours has now
been running for 5 days.  During this time the device has operated
perfectly, with no JFFS2 errors at all.  So it seems that the problem
has been fixed.

Just an FYI, in case someone is considering merging these patches into
CVS.  Thanks

--=20
Matthew L. Creech=20
