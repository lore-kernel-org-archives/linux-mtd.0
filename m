Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cweid-000052-Hz
 for linux-mtd@lists.infradead.org; Sat, 08 Apr 2017 00:59:13 +0000
Received: by mail-pg0-x243.google.com with SMTP id 81so18670147pgh.3
 for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2017 17:58:51 -0700 (PDT)
From: Deepa Dinamani <deepa.kernel@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: tglx@linutronix.de, viro@zeniv.linux.org.uk, gregkh@linuxfoundation.org,
 andreas.dilger@intel.com, arnd@arndb.de, bfields@fieldses.org, clm@fb.com,
 davem@davemloft.net, dsterba@suse.com, dushistov@mail.ru,
 eparis@redhat.com, jaegeuk@kernel.org, jbacik@fb.com,
 jlayton@poochiereds.net, john.stultz@linaro.org, jsimmons@infradead.org,
 mingo@redhat.com, oleg.drokin@intel.com, paul@paul-moore.com,
 rostedt@goodmis.org, yuchao0@huawei.com, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-audit@redhat.com,
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-security-module@vger.kernel.org,
 lustre-devel@lists.lustre.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, y2038@lists.linaro.org
Subject: [PATCH 11/12] time: Delete CURRENT_TIME_SEC and CURRENT_TIME
Date: Fri,  7 Apr 2017 17:57:09 -0700
Message-Id: <1491613030-11599-12-git-send-email-deepa.kernel@gmail.com>
In-Reply-To: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
References: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All uses of CURRENT_TIME_SEC and CURRENT_TIME macros have
been replaced by other time functions. These macros are
also not y2038 safe.
And, all their use cases can be fulfilled by y2038 safe
ktime_get_* variants.

Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
Acked-by: John Stultz <john.stultz@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/time.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/time.h b/include/linux/time.h
index 23f0f5c..c0543f5 100644
--- a/include/linux/time.h
+++ b/include/linux/time.h
@@ -151,9 +151,6 @@ static inline bool timespec_inject_offset_valid(const struct timespec *ts)
 	return true;
 }
 
-#define CURRENT_TIME		(current_kernel_time())
-#define CURRENT_TIME_SEC	((struct timespec) { get_seconds(), 0 })
-
 /* Some architectures do not supply their own clocksource.
  * This is mainly the case in architectures that get their
  * inter-tick times by reading the counter on their interval
-- 
2.7.4
