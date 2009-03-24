Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmA2o-0004QF-25
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 17:04:13 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Tue, 24 Mar 2009 11:04:02 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <49C8FC89.7040709@nokia.com>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
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

Hi Adrian,

> Please enable UBIFS debugging and set the UBIFS Default message level
to 3.

Thanks for the response.  Enabling UBIFS debugging and setting to level
3 only provides slightly more information. =20

[42949375.480000] UBIFS: recovery needed
[42949376.450000] UBIFS error (pid 1): ubifs_scan: corrupt empty space
at LEB 4:44512
[42949376.460000] UBIFS error (pid 1): ubifs_scanned_corruption:
corrupted data at LEB 4:44512
[42949376.470000] UBIFS error (pid 1): ubifs_scanned_corruption: first
4096 bytes from LEB 4:44512
[42949376.490000] UBIFS error (pid 1): ubifs_scan: LEB 4 scanning failed
[42949376.540000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
space at LEB 4:480
[42949376.550000] UBIFS error (pid 1): ubifs_scanned_corruption:
corrupted data at LEB 4:480
[42949376.560000] UBIFS error (pid 1): ubifs_scanned_corruption: first
4096 bytes from LEB 4:480
[42949376.580000] UBIFS error (pid 1): ubifs_recover_leb: LEB 4 scanning
failed
[42949376.600000] VFS: Cannot open root device "ubi0:rootfs" or
unknown-block(0,0)


> Also, could you tell us what MTD drivers you are using?
I'm using the physmap CFI flash driver for a CFI-compliant S29GL256P90F
256Mbit NOR flash chip.  Is that what you're asking for?

I'll keep working on a better way to reproduce the problem.  Let me know
if I need to add some printk statements somewhere and/or enable UBI or
MTD debugging.

Thanks,

Eric
