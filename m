Received: from na3sys009aog104.obsmtp.com ([74.125.149.73])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QQ4sY-0007rW-AA
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 21:47:35 +0000
Received: by mail-vx0-f169.google.com with SMTP id 20so2194470vxk.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 May 2011 14:47:31 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 27 May 2011 17:47:31 -0400
Message-ID: <BANLkTimWafVH_bCJomN1uFW=t4+jRw1L9g@mail.gmail.com>
Subject: -EBADMSG with free-space-fixup flag
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Matthew L. Creech" <mlcreech@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew, Artem,

Following-up on my problems with the free-space-fixup no da850evm.

I have done lots of manual testing with u-boot and mtd-utils on-top-of
'c724452 UBIFS: switch to dynamic printks' to confirm that there isn't
an 0xff ECC problem with davinci-nand.

I found that by the time the -74 is returned for PEB 18, the contents
on NAND have been replaced.

I turned on lots of UBIFS debugging and saw that the PEB in question
is in fact LEB 1; which is geting written to as part of the
auto-resize of (master)

NB: I have ubi attached with --vid-hdr-offset of 2048 because of the
subpage writing limitations of davinci-nand.

UBIFS DBG mnt: Auto resizing (master) from 497 LEBs to 1754 LEBs
UBIFS DBG io: LEB 496:101088, indexing node, length 68
UBIFS DBG io: LEB 1:2048, master node, length 512 (aligned 2048)
UBIFS DBG io: LEB 2:2048, master node, length 512 (aligned 2048)
[...]
UBIFS DBG mnt: fixup LEB 1, data len 4096
UBI error: ubi_io_read: error -74 (ECC error) while reading 4096 bytes
from PEB 18:4096, read 4096 bytes

Naively copying the call to ubifs_fixup_free_space() in mount_ubifs()
to above the call to ubifs_read_master() results in dereferencing a
null pointer. Is doing the fix-up before the resize of (master) the
right approach here?

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
