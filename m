Received: from eeout.etn.com ([63.67.43.145] helo=pitpashub02.nasa.ad.etn.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwM06-0000nJ-I5
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 10:01:03 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Feb 2005 10:00:56 -0500
Message-ID: <F0A064EBC8C91C449244D108367426DC01E4AFEF@ra1ncsmb01.nasa.ad.etn.com>
From: "Creech, Matthew" <MattCreech@eaton.com>
To: <linux-mtd@lists.infradead.org>,
	<jffs-dev@axis.com>
Cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: JFFS2 on dataflash problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please forgive the cross-posting, but I'm not sure where exactly to go
with this problem.

I have an embedded device based on Atmel's AT91RM9200DK board, which is
using serial dataflash (AT45DB642).  I've allocated a JFFS2 partition to
store non-volatile data.  In testing I stumbled across a particular
problem that only occurs after heavy hammering on our device, but is
fairly consistent in how and when it occurs.  The pattern has been
narrowed down so that a script doing something like this:

while [ 1 ]; do
   cp /mnt/jffs2/$RANDOM_FILE /mnt/jffs2/$BLAH
   # File size has been tested between 8K and 64K
done

makes the problem occur within 24 to 36 hours.  So something about
copying one file over another one breaks things.  The "problem" here is
that every I/O operation having to do with the JFFS2 partition blocks
indefinitely.  For example, after running the test for 2 days, you can
log into the device and try to "ls" the contents of /mnt/jffs2, and your
shell will hang.  You can then login on another terminal, but you'll get
another hang if you try to have any interaction with the JFFS2
partition.  So everything else seems to function normally, but JFFS2
just dies.  Also note that rebooting the device sometimes fixes things
right up (JFFS2 mounts fine and works properly as if nothing happened at
all), but sometimes the filesystem image is corrupt and refuses to
mount.

The system's specs are as follows:
AT91RM9200
AT45DB642 8MB serial dataflash device on SPI channel
2.4.25 kernel with VRS2 patchset, plus...
Andrew Victor's AT91 patchset (http://maxim.org.za/AT91RM9200/), plus...
Various snapshots of MTD taken over the past several months (no change)
Snapgear-3.2.0 userland (doubt this makes a difference)

As noted above, I've tried this with various MTD snapshots (using the
default MTD in 2.4.25 makes JFFS2 die almost immediately when doing
anything).  I've also recently compiled 2.6.10 with the AT91 patchset
(http://maxim.org.za/AT91RM9200/2.6/), but the *exact* same thing
happens.

The only kernel output I get is a few repetitions of this message, just
before the problem begins:

Node totlen on flash (0xffffffff) !=3D totlen from node ref ([some
close-to-zero number])

My testing using raw dataflash access seems to rule out dataflash
issues, and _suggest_ that MTD isn't directly to blame, since no errors
occur when copying images to /dev/mtd/X then reading them back.  But I
can't rule anything out for sure.  It seems more likely that this is
some strange interaction between dataflash, MTD, and JFFS2, possibly
related to this device's 1056-byte blocksize; IIRC this was a problem in
the past that required some patching, since most code assumes a
power-of-two blocksize.

These are all just guesses, though, which is why I'm posting this
message.  I'm wondering whether there are any other ideas I can try to
narrow this problem down; since testing it requires 1-2 days, it's
fruitless to just make random guesses and see if they "fix" things.  Any
suggestions you have are greatly appreciated!

Thanks for the help

--=20
Matthew L. Creech=20
