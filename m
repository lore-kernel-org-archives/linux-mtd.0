Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XyVx-000330-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 07:23:50 +0100
To: <linux-mtd@lists.infradead.org>, LinuxBIOS <linuxbios@lanl.gov>
Subject: Compact Flash is a valid canidate for an MTD device.
From: Eric W Biederman <ebiederman@lnxi.com>
Date: 26 Jul 2002 00:23:44 -0600
Message-ID: <m3ofcv57nz.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

The Compact Flash extensions to the IDE command set, there is information
that they can indeed be treated as a normal mtd character device.

In particular the following commands were added to IDE.
-  CFA REQUEST EXTENDED ERROR CODE
-  CFA WRITE SECTORS WITHOUT ERASE
-  CFA ERASE SECTORS
-  CFA WRITE MULTIPLE WITHOUT ERASE
-  CFA TRANSLATE SECTOR
-  SET FEATURES Enable/Disable 8-bit transfer

They aren't a perfectly normal flash chip but, you do have the ability
to just erase or to just write sectors.  CFA TRANSLATE SECTOR gives
information on how many times an individual sector has been erased, so
it is possible to implement wear-leveling above the CFA device.

It appears to me there would be noticeable benefit to configuring a
Compact Flash device as an MTD device, and running JFFS on top of it.

I haven't had a chance to try it yet, but hopefully this will point
someone in a useful direction.

Eric
