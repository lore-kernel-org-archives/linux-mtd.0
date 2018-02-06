Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejVTl-0003Ug-Jl
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 19:34:03 +0000
Received: by mail-pl0-x241.google.com with SMTP id f8-v6so651366plk.11
 for <linux-mtd@lists.infradead.org>; Wed, 07 Feb 2018 11:33:50 -0800 (PST)
Received: from localhost ([223.27.245.122])
 by smtp.gmail.com with ESMTPSA id g2sm4605886pgq.43.2018.02.07.11.33.48
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 07 Feb 2018 11:33:48 -0800 (PST)
Message-ID: <5a7b549c.4251650a.3b19f.6709@mx.google.com>
Sender: =?UTF-8?B?UsOpY3pleSBCw6FsaW50?= <rbalint@gmail.com>
From: Balint Reczey <balint@balintreczey.hu>
Date: Wed, 7 Feb 2018 03:49:14 +0700
Subject: [PATCH 1/2] mtd: unittests: Use proper unsigned long type for ioctl
 requests
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This fixes tests on s390x

Signed-off-by: Balint Reczey <balint.reczey@canonical.com>
---
 tests/unittests/test_lib.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unittests/test_lib.h b/tests/unittests/test_lib.h
index 122672b..f5f0f34 100644
--- a/tests/unittests/test_lib.h
+++ b/tests/unittests/test_lib.h
@@ -40,7 +40,7 @@ int __wrap_close(int fd)
 	return retval;
 }
 
-int __wrap_ioctl(int fd, int req, ...)
+int __wrap_ioctl(int fd, unsigned long req, ...)
 {
 	assert_true(fd > 0);
 	check_expected(req);
@@ -108,14 +108,14 @@ off_t __wrap_lseek(int fd, off_t seek, int whence)
 	} while(0);
 
 #define expect_ioctl(W,X,Y,Z) do { \
-		expect_value(__wrap_ioctl, req, (int)W);\
+		expect_value(__wrap_ioctl, req, W);\
 		will_return(__wrap_ioctl, X);\
 		will_return(__wrap_ioctl, Y);\
 		will_return(__wrap_ioctl, Z);\
 	} while(0);
 
 #define expect_ioctl_short(X,Y) do { \
-		expect_value(__wrap_ioctl, req, (int)X);\
+		expect_value(__wrap_ioctl, req, X);\
 		will_return(__wrap_ioctl, Y);\
 		will_return(__wrap_ioctl, NULL);\
 		will_return(__wrap_ioctl, 0);\
-- 
2.14.1
