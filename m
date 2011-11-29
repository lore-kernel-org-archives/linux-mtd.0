Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVVz8-0004xq-QI
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 22:17:07 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-doc@vger.kernel.org,
	dedekind1@gmail.com
Subject: [PATCH] Documentation: add sysfs entries for mtd docg3 chips
Date: Tue, 29 Nov 2011 23:16:35 +0100
Message-Id: <1322604995-7419-1-git-send-email-robert.jarzmik@free.fr>
Cc: greg@kroah.com, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add documentation for MSystems disk-on-chip docg3 chips
sysfs entries, which enable and disable protection areas,
giving or disabling access to the chip's memory.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 .../ABI/testing/sysfs-devices-platform-docg3       |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-docg3

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-docg3 b/Documentation/ABI/testing/sysfs-devices-platform-docg3
new file mode 100644
index 0000000..8aa3671
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-docg3
@@ -0,0 +1,34 @@
+What:		/sys/devices/platform/docg3/f[0-3]_dps[01]_is_keylocked
+Date:		November 2011
+KernelVersion:	3.3
+Contact:	Robert Jarzmik <robert.jarzmik@free.fr>
+Description:
+		Show whether the floor (0 to 4), protection area (0 or 1) is
+		keylocked. Each docg3 chip (or floor) has 2 protection areas,
+		which can cover any part of it, block aligned, called DPS.
+		The protection has information embedded whether it blocks reads,
+		writes or both.
+		The result is:
+		0 -> the DPS is not keylocked
+		1 -> the DPS is keylocked
+Users:		None identified so far.
+
+What:		/sys/devices/platform/docg3/f[0-3]_dps[01]_protection_key
+Date:		November 2011
+KernelVersion:	3.3
+Contact:	Robert Jarzmik <robert.jarzmik@free.fr>
+Description:
+		Enter the protection key for the floor (0 to 4), protection area
+		(0 or 1). Each docg3 chip (or floor) has 2 protection areas,
+		which can cover any part of it, block aligned, called DPS.
+		The protection has information embedded whether it blocks reads,
+		writes or both.
+		The protection key is a string of 8 bytes (value 0-255).
+		Entering the correct value toggle the lock, and can be observed
+		through f[0-3]_dps[01]_is_keylocked.
+		Possible values are:
+			- 8 bytes
+		Typical values are:
+			- "00000000"
+			- "12345678"
+Users:		None identified so far.
-- 
1.7.5.4
