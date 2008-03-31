Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgNBh-0001Zm-AK
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 16:48:50 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF bindings
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 31 Mar 2008 18:39:10 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200803311839.10519.laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org,
	Rune Torgersen <runet@innovsys.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
=2D--
 Documentation/powerpc/booting-without-of.txt |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/Documentation/powerpc/booting-without-of.txt b/Documentation/p=
owerpc/booting-without-of.txt
index 7b4e8a7..3e1963b 100644
=2D-- a/Documentation/powerpc/booting-without-of.txt
+++ b/Documentation/powerpc/booting-without-of.txt
@@ -57,7 +57,8 @@ Table of Contents
       n) 4xx/Axon EMAC ethernet nodes
       o) Xilinx IP cores
       p) Freescale Synchronous Serial Interface
=2D	  q) USB EHCI controllers
+      q) USB EHCI controllers
+      r) Memory-mapped RAM & ROM
=20
   VII - Specifying interrupt information for devices
     1) interrupts property
@@ -2816,6 +2817,16 @@ platforms are moved over to use the flattened-device=
=2Dtree model.
 		   big-endian;
 	   };
=20
+   r) Memory-mapped RAM & ROM
+
+    Dedicated RAM and ROM chips are often used as storage for temporary or
+    permanent data in embedded devices. Possible usage include non-volatile
+    storage in battery-backed SRAM, semi-permanent storage in dedicated SR=
AM
+    to preserve data accross reboots and firmware storage in dedicated ROM.
+
+     - name : should be either "ram" or "rom"
+     - reg : Address range of the RAM/ROM chip
+
=20
    More devices will be defined as this spec matures.
=20
=2D-=20
1.5.0


=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
