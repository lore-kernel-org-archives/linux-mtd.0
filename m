Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFzPP-0006zY-3v
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 08:55:17 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: fstests@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, richard@nod.at,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v2 1/4] Add tests for character devices
Date: Wed, 31 May 2017 10:54:30 +0200
Message-Id: <20170531085433.26865-2-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170531085433.26865-1-david.oberhollenzer@sigma-star.at>
References: <20170531085433.26865-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement _is_char_dev similar to _is_block_dev to test for
character devices.

Add a _require_local_device test. This test is similar to
_require_block_device but checks if the path refers to a
block or a character device.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 common/rc | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/common/rc b/common/rc
index ba215961..ae8ea550 100644
--- a/common/rc
+++ b/common/rc
@@ -1363,6 +1363,26 @@ _is_block_dev()
     fi
 }
 
+# returns device number if a file is a character device
+#
+_is_char_dev()
+{
+    if [ $# -ne 1 ]
+    then
+	echo "Usage: _is_char_dev dev" 1>&2
+	exit 1
+    fi
+
+    _dev=$1
+    if [ -L "${_dev}" ]; then
+        _dev=`readlink -f "${_dev}"`
+    fi
+
+    if [ -c "${_dev}" ]; then
+        src/lstat64 "${_dev}" | $AWK_PROG '/Device type:/ { print $9 }'
+    fi
+}
+
 # Do a command, log it to $seqres.full, optionally test return status
 # and die if command fails. If called with one argument _do executes the
 # command, logs it, and returns its exit status. With two arguments _do
@@ -1791,6 +1811,23 @@ _require_block_device()
 	fi
 }
 
+# this test requires a path to refere to a local block or character device
+# $1 - device
+_require_local_device()
+{
+	if [ -z "$1" ]; then
+		echo "Usage: _require_local_device <dev>" 1>&2
+		exit 1
+	fi
+	if [ "`_is_block_dev "$1"`" != "" ]; then
+		return 0
+	fi
+	if [ "`_is_char_dev "$1"`" != "" ]; then
+		return 0
+	fi
+	_notrun "require $1 to be local device"
+}
+
 # brd based ram disks erase the device when they receive a flush command when no
 # active references are present. This causes problems for DM devices sitting on
 # top of brd devices as DM doesn't hold active references to the brd device.
-- 
2.12.0
