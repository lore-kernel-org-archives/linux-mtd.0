Received: from s20.s20avahost.net ([207.44.250.61])
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FYZ0E-0001Bn-LS
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 21:39:40 -0400
Received: from h-67-101-205-98.chcgilgm.covad.net ([67.101.205.98]
	helo=www.westnelson.net) by s20.s20avahost.net with esmtp (Exim 4.52)
	id 1FYTzH-0002Il-U4
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 15:18:20 -0500
Message-ID: <44871.129.188.33.221.1145996362.squirrel@www.westnelson.net>
Date: Tue, 25 Apr 2006 15:19:22 -0500 (CDT)
From: "Peter Buelow" <pete@putzin.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Unlocking Intel flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok, hoping someone knows, because Google isn't helping oddly enough. I've
just started putting together some work that includes adding a JFFS2
partition using MTD (obviously) that sits on it's own (ie, it's not
bootable and is just a small area that I would like to read/write to where
the rest of the FS is squashfs read only). Basically, an rc script either
creates it, or mounts it depending, and then I would use it mounted under
/store. Here's what's happening.

I can create the JFFS2 fielsystem, no errors. I can mount the new
filesystem, no errors. I can initially write to the filesystem, but then
the writes fail (usually after the first write) with the following error

Write of 68 bytes at 0x000e0214 failed. returned 0, retlen 0

This happens after initial creation and will happen immediately after
reboot and remount of the existing partition. OK, so I need to unlock the
flash maybe? I try the unlock command, and get the following.

# unlock /dev/mtdblock/8
Could not get MTD device info from /dev/mtdblock/8

I've looked at the error leg in the kernel, but am not familiar enough
with MTD to make an informed decision as to why it's failing. Hoping
someone here can help.

This is a stock 2.4.17 kernel, no patches to MTD (yet?) and gcc version
2.95.3. It's Intel Strata flash, the P30 family. Many thanks in advance to
anyone who can help.

-- 
"Knowledge is in every country the surest basis of public happiness."
George Washington (State of the Union address, 1790)
--
Pete
