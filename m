Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWew-0005gZ-BX
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:54 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 24/30] ntb.txt: standardize document format
Date: Thu, 18 May 2017 22:24:16 -0300
Message-Id: <f59998c5f5ac18582e18be318fddfa6518ffc84c.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx.

This file is using some other markup notation (likely, markdown).
Convert it to the adopted standard:

  - Adjust the header level markup;
  - Adjust identation for debugfs files and module parameters.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/ntb.txt | 55 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/Documentation/ntb.txt b/Documentation/ntb.txt
index 1d9bbabb6c79..e4771e5c2ad7 100644
--- a/Documentation/ntb.txt
+++ b/Documentation/ntb.txt
@@ -1,4 +1,6 @@
-# NTB Drivers
+===========
+NTB Drivers
+===========
 
 NTB (Non-Transparent Bridge) is a type of PCI-Express bridge chip that connects
 the separate memory systems of two computers to the same PCI-Express fabric.
@@ -10,7 +12,8 @@ fixed address.  Doorbell registers provide a way for peers to send interrupt
 events.  Memory windows allow translated read and write access to the peer
 memory.
 
-## NTB Core Driver (ntb)
+NTB Core Driver (ntb)
+=====================
 
 The NTB core driver defines an api wrapping the common feature set, and allows
 clients interested in NTB features to discover NTB the devices supported by
@@ -18,7 +21,8 @@ hardware drivers.  The term "client" is used here to mean an upper layer
 component making use of the NTB api.  The term "driver," or "hardware driver,"
 is used here to mean a driver for a specific vendor and model of NTB hardware.
 
-## NTB Client Drivers
+NTB Client Drivers
+==================
 
 NTB client drivers should register with the NTB core driver.  After
 registering, the client probe and remove functions will be called appropriately
@@ -26,7 +30,8 @@ as ntb hardware, or hardware drivers, are inserted and removed.  The
 registration uses the Linux Device framework, so it should feel familiar to
 anyone who has written a pci driver.
 
-### NTB Transport Client (ntb\_transport) and NTB Netdev (ntb\_netdev)
+NTB Transport Client (ntb\_transport) and NTB Netdev (ntb\_netdev)
+------------------------------------------------------------------
 
 The primary client for NTB is the Transport client, used in tandem with NTB
 Netdev.  These drivers function together to create a logical link to the peer,
@@ -37,7 +42,8 @@ Transport queue pair.  Network data is copied between socket buffers and the
 Transport queue pair buffer.  The Transport client may be used for other things
 besides Netdev, however no other applications have yet been written.
 
-### NTB Ping Pong Test Client (ntb\_pingpong)
+NTB Ping Pong Test Client (ntb\_pingpong)
+-----------------------------------------
 
 The Ping Pong test client serves as a demonstration to exercise the doorbell
 and scratchpad registers of NTB hardware, and as an example simple NTB client.
@@ -64,7 +70,8 @@ Module Parameters:
 * dyndbg - It is suggested to specify dyndbg=+p when loading this module, and
 	then to observe debugging output on the console.
 
-### NTB Tool Test Client (ntb\_tool)
+NTB Tool Test Client (ntb\_tool)
+--------------------------------
 
 The Tool test client serves for debugging, primarily, ntb hardware and drivers.
 The Tool provides access through debugfs for reading, setting, and clearing the
@@ -74,48 +81,60 @@ The Tool does not currently have any module parameters.
 
 Debugfs Files:
 
-* *debugfs*/ntb\_tool/*hw*/ - A directory in debugfs will be created for each
+* *debugfs*/ntb\_tool/*hw*/
+	A directory in debugfs will be created for each
 	NTB device probed by the tool.  This directory is shortened to *hw*
 	below.
-* *hw*/db - This file is used to read, set, and clear the local doorbell.  Not
+* *hw*/db
+	This file is used to read, set, and clear the local doorbell.  Not
 	all operations may be supported by all hardware.  To read the doorbell,
 	read the file.  To set the doorbell, write `s` followed by the bits to
 	set (eg: `echo 's 0x0101' > db`).  To clear the doorbell, write `c`
 	followed by the bits to clear.
-* *hw*/mask - This file is used to read, set, and clear the local doorbell mask.
+* *hw*/mask
+	This file is used to read, set, and clear the local doorbell mask.
 	See *db* for details.
-* *hw*/peer\_db - This file is used to read, set, and clear the peer doorbell.
+* *hw*/peer\_db
+	This file is used to read, set, and clear the peer doorbell.
 	See *db* for details.
-* *hw*/peer\_mask - This file is used to read, set, and clear the peer doorbell
+* *hw*/peer\_mask
+	This file is used to read, set, and clear the peer doorbell
 	mask.  See *db* for details.
-* *hw*/spad - This file is used to read and write local scratchpads.  To read
+* *hw*/spad
+	This file is used to read and write local scratchpads.  To read
 	the values of all scratchpads, read the file.  To write values, write a
 	series of pairs of scratchpad number and value
 	(eg: `echo '4 0x123 7 0xabc' > spad`
 	# to set scratchpads `4` and `7` to `0x123` and `0xabc`, respectively).
-* *hw*/peer\_spad - This file is used to read and write peer scratchpads.  See
+* *hw*/peer\_spad
+	This file is used to read and write peer scratchpads.  See
 	*spad* for details.
 
-## NTB Hardware Drivers
+NTB Hardware Drivers
+====================
 
 NTB hardware drivers should register devices with the NTB core driver.  After
 registering, clients probe and remove functions will be called.
 
-### NTB Intel Hardware Driver (ntb\_hw\_intel)
+NTB Intel Hardware Driver (ntb\_hw\_intel)
+------------------------------------------
 
 The Intel hardware driver supports NTB on Xeon and Atom CPUs.
 
 Module Parameters:
 
-* b2b\_mw\_idx - If the peer ntb is to be accessed via a memory window, then use
+* b2b\_mw\_idx
+	If the peer ntb is to be accessed via a memory window, then use
 	this memory window to access the peer ntb.  A value of zero or positive
 	starts from the first mw idx, and a negative value starts from the last
 	mw idx.  Both sides MUST set the same value here!  The default value is
 	`-1`.
-* b2b\_mw\_share - If the peer ntb is to be accessed via a memory window, and if
+* b2b\_mw\_share
+	If the peer ntb is to be accessed via a memory window, and if
 	the memory window is large enough, still allow the client to use the
 	second half of the memory window for address translation to the peer.
-* xeon\_b2b\_usd\_bar2\_addr64 - If using B2B topology on Xeon hardware, use
+* xeon\_b2b\_usd\_bar2\_addr64
+	If using B2B topology on Xeon hardware, use
 	this 64 bit address on the bus between the NTB devices for the window
 	at BAR2, on the upstream side of the link.
 * xeon\_b2b\_usd\_bar4\_addr64 - See *xeon\_b2b\_bar2\_addr64*.
-- 
2.9.4
