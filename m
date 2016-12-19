Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ2x3-0002wQ-3w
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 18:46:23 +0000
Received: by mail-pg0-x244.google.com with SMTP id p66so19238896pga.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 10:45:59 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: fstests@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Gstir <david@sigma-star.at>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@google.com>
Subject: [RFC][PATCH 1/2] xfstests: add experimental support for ubifs
Date: Mon, 19 Dec 2016 10:45:31 -0800
Message-Id: <1482173132-100690-2-git-send-email-ebiggers3@gmail.com>
In-Reply-To: <1482173132-100690-1-git-send-email-ebiggers3@gmail.com>
References: <1482173132-100690-1-git-send-email-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

This experimental patch adds ubifs support to xfstests.  Unlike most
filesystems, ubifs is not block-device based.  Instead it uses an UBI
volume, which is layered above a MTD (raw flash) device.  An UBI volume
is represented by a char device node, e.g. /dev/ubi0_0.  To run xfstests
on ubifs, the user must set TEST_DEV to point to an UBI volume formatted
as ubifs and SCRATCH_DEV to point to some other UBI volume.  Most things
seem to just work, but a few changes were needed to allow TEST_DEV and
SCRATCH_DEV to be char devices, and to handle the lack of a fsck.ubifs.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/config |  7 +++++--
 common/rc     | 24 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/common/config b/common/config
index 6cce7ce..cf01c9e 100644
--- a/common/config
+++ b/common/config
@@ -331,6 +331,9 @@ _mount_opts()
 		# We need to specify the size at mount, use 1G by default
 		export MOUNT_OPTIONS="-o size=1G $TMPFS_MOUNT_OPTIONS"
 		;;
+	ubifs)
+		export MOUNT_OPTIONS=$UBIFS_MOUNT_OPTIONS
+		;;
 	*)
 		;;
 	esac
@@ -461,8 +464,8 @@ _check_device()
 		if [ ! -d "$dev" ]; then
 			_fatal "common/config: $name ($dev) is not a directory for overlay"
 		fi
-	elif [ ! -b "$dev" -a "$network_dev" != "0" ]; then
-		_fatal "common/config: $name ($dev) is not a block device or a network filesystem"
+	elif [ ! -b "$dev" -a ! -c "$dev" -a "$network_dev" != "0" ]; then
+		_fatal "common/config: $name ($dev) is not a device node or network filesystem"
 	fi
 }
 
diff --git a/common/rc b/common/rc
index 2639fbd..8000abb 100644
--- a/common/rc
+++ b/common/rc
@@ -1308,6 +1308,15 @@ _require_scratch_nocheck()
 		    _notrun "this test requires a valid \$SCRATCH_MNT and unique $SCRATCH_DEV"
 		fi
 		;;
+	ubifs)
+		# ubifs needs an UBI volume. This will be a char device, not a block device.
+		if [ ! -c "$SCRATCH_DEV" ]; then
+			_notrun "this test requires a valid UBI volume for \$SCRATCH_DEV"
+		fi
+		if [ ! -d "$SCRATCH_MNT" ]; then
+			_notrun "this test requires a valid \$SCRATCH_MNT"
+		fi
+		;;
 	*)
 		 if [ -z "$SCRATCH_DEV" -o "`_is_block_dev "$SCRATCH_DEV"`" = "" ]
 		 then
@@ -1393,6 +1402,15 @@ _require_test()
 		    _notrun "this test requires a valid \$TEST_DIR and unique $TEST_DEV"
 		fi
 		;;
+	ubifs)
+		# ubifs needs an UBI volume. This will be a char device, not a block device.
+		if [ ! -c "$TEST_DEV" ]; then
+			_notrun "this test requires a valid UBI volume for \$TEST_DEV"
+		fi
+		if [ ! -d "$TEST_DIR" ]; then
+			_notrun "this test requires a valid \$TEST_DIR"
+		fi
+		;;
 	*)
 		 if [ -z "$TEST_DEV" ] || [ "`_is_block_dev "$TEST_DEV"`" = "" ]
 		 then
@@ -2171,6 +2189,9 @@ _check_test_fs()
     tmpfs)
 	# no way to check consistency for tmpfs
 	;;
+    ubifs)
+	# there is no fsck program for ubifs yet
+	;;
     *)
 	_check_generic_filesystem $TEST_DEV
 	;;
@@ -2215,6 +2236,9 @@ _check_scratch_fs()
     tmpfs)
 	# no way to check consistency for tmpfs
 	;;
+    ubifs)
+	# there is no fsck program for ubifs yet
+	;;
     *)
 	_check_generic_filesystem $device
 	;;
-- 
2.8.0.rc3.226.g39d4020
