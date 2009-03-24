Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmBB8-0006Y1-KN
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 18:16:52 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Tue, 24 Mar 2009 12:16:43 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702DEF1A8@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net><49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "Adrian Hunter" <adrian.hunter@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'll keep working on a better way to reproduce the problem. =20
> Let me know if I need to add some printk statements somewhere and/or
enable UBI or MTD debugging.=20

Here's an easier way to create a similar corruption of the file system
by creating the device nodes on /dev as part of the UBIFS root file
system instead of mounting tmpfs on /dev.

Note that I'm using the Busybox (1.12.4) mdev utility to create the
device nodes:

 1. Setup a system that uses UBIFS as the root file system
 2. Skip mounting tmpfs on /dev (mount -t tmpfs none /dev)
 3. Create the device nodes on /dev
	mount -t sysfs none /sys
	mdev -s

Now that the device nodes (including the /dev/ubi* and /dev/mtd* nodes)
have been created on the RFS, doing an unmount will cause corruption of
the UBI RFS:

	umount -a
	reboot -f

I know this is an odd case, but it looks like it simulates the same
failure very well on my board without having to cycle power while
writing to flash.

Basic board information:
  Linux 2.6.27
  UBIFS on 32MB NOR Flash mapped using physmap driver
  Atmel ARM9 AT91SAM9263
 =20
-Eric

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Eric
Holmberg
Sent: Tuesday, March 24, 2009 11:04 AM
To: Adrian Hunter
Cc: linux-mtd@lists.infradead.org
Subject: RE: UBIFS Corrupt during power failure

Hi Adrian,

> Please enable UBIFS debugging and set the UBIFS Default message level
to 3.

Thanks for the response.  Enabling UBIFS debugging and setting to level
3 only provides slightly more information. =20

[42949375.480000] UBIFS: recovery needed [42949376.450000] UBIFS error
(pid 1): ubifs_scan: corrupt empty space at LEB 4:44512
[42949376.460000] UBIFS error (pid 1): ubifs_scanned_corruption:
corrupted data at LEB 4:44512
[42949376.470000] UBIFS error (pid 1): ubifs_scanned_corruption: first
4096 bytes from LEB 4:44512
[42949376.490000] UBIFS error (pid 1): ubifs_scan: LEB 4 scanning failed
[42949376.540000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
space at LEB 4:480 [42949376.550000] UBIFS error (pid 1):
ubifs_scanned_corruption:
corrupted data at LEB 4:480
[42949376.560000] UBIFS error (pid 1): ubifs_scanned_corruption: first
4096 bytes from LEB 4:480
[42949376.580000] UBIFS error (pid 1): ubifs_recover_leb: LEB 4 scanning
failed [42949376.600000] VFS: Cannot open root device "ubi0:rootfs" or
unknown-block(0,0)


> Also, could you tell us what MTD drivers you are using?
I'm using the physmap CFI flash driver for a CFI-compliant S29GL256P90F
256Mbit NOR flash chip.  Is that what you're asking for?

I'll keep working on a better way to reproduce the problem.  Let me know
if I need to add some printk statements somewhere and/or enable UBI or
MTD debugging.

Thanks,

Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
