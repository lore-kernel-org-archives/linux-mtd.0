Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMEAo-0000vR-6i
	for linux-mtd@lists.infradead.org; Sat, 27 Nov 2010 06:22:14 +0000
Received: by mail-yx0-f177.google.com with SMTP id 34so1339163yxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 22:22:14 -0800 (PST)
From: "Justin P. Mattock" <justinmattock@gmail.com>
To: trivial@kernel.org
Subject: [RFC 9/9]include:linux Change the copyright info.
Message-Id: <1290838879-11038-10-git-send-email-justinmattock@gmail.com>
In-Reply-To: <1290838879-11038-1-git-send-email-justinmattock@gmail.com>
References: <1290838879-11038-1-git-send-email-justinmattock@gmail.com>
Cc: linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	"Justin P. Mattock" <justinmattock@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sat, 27 Nov 2010 06:22:15 -0000

Change the copyright info from Sun Microsystems to Oracle since Oracle now owns them.

Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>

---
 include/linux/ethtool.h       |    4 ++--
 include/linux/mlx4/doorbell.h |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 6628a50..2d895be 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -3,11 +3,11 @@
  *
  * Copyright (C) 1998 David S. Miller (davem@redhat.com)
  * Copyright 2001 Jeff Garzik <jgarzik@pobox.com>
- * Portions Copyright 2001 Sun Microsystems (thockin@sun.com)
+ * Portions Copyright 2001 Oracle and/or its affiliates. (thockin@sun.com)
  * Portions Copyright 2002 Intel (eli.kupermann@intel.com,
  *                                christopher.leech@intel.com,
  *                                scott.feldman@intel.com)
- * Portions Copyright (C) Sun Microsystems 2008
+ * Portions Copyright (C) 2008 Oracle and/or its affiliates. 
  */
 
 #ifndef _LINUX_ETHTOOL_H
diff --git a/include/linux/mlx4/doorbell.h b/include/linux/mlx4/doorbell.h
index f31bba2..d251ee8 100644
--- a/include/linux/mlx4/doorbell.h
+++ b/include/linux/mlx4/doorbell.h
@@ -1,6 +1,6 @@
 /*
  * Copyright (c) 2004 Topspin Communications.  All rights reserved.
- * Copyright (c) 2005 Sun Microsystems, Inc. All rights reserved.
+ * Copyright (c) 2005 Oracle and/or its affiliates. All rights reserved.
  * Copyright (c) 2005 Mellanox Technologies. All rights reserved.
  *
  * This software is available to you under a choice of one of two
-- 
1.7.1
