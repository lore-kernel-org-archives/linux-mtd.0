Received: from scorpius.ca.canon.com ([146.184.4.62] helo=cdasc02.sc.rd.canon.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a31N-000892-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 00:36:49 +0100
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Problem with JFFS2 and Toshiba TC58FVB641 flash chips
Date: Wed, 31 Jul 2002 16:36:48 -0700
Message-ID: <D775A533262CD141BADE285756C75FEA2B1EF1@cdasc02.sc.rd.canon.com>
From: "Suzuki, Stephanie" <Stephanie.Suzuki@cda.canon.com>
To: <linux-mtd@lists.infradead.org>
Cc: "Suzuki, Stephanie" <Stephanie.Suzuki@cda.canon.com>
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

I am using the MTD and JFFS2 that came with the 2.4.18 kernel.  I have =
Toshiba's TC58FVB641 Flash chips on my system.  For the most part, this =
has been working well.  I have been able to create, boot, and modify a =
complete root filesystem.  However, I have experienced an intermittent =
problem when I modify the filesystem.  If I upload and install an rpm to =
my system that writes quite a few files (say 50) to my jffs2 partition, =
then warm boot my system, I will sometimes get the following error upon =
boot:

Flash device: 1000000 at bf000000
Flash start =3D bf000000, Flash end =3D c0000000
CFI: Found no Flash Partition device at location zero
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Cannot open root device "mtdblock3" or 1f:03

I then have to do a cold boot to make the problem go away.  I read in =
the archives of this list something about the flash chips getting stuck =
in a write state.  So prior to the warm boot, I did a       =20
        /bin/mount / / -o remount,ro
        dd if=3D/dev/mtd3 of=3D/tmp/duh count=3D1
        /bin/sync
        /bin/sync
        /sbin/init 6
to try and get it back into a good state.  It did not help.

I've also tried to modify my bootloader to send a read/reset command to =
the flash chip, but that did not work either.  Has anyone seen this or =
have any suggestions?
