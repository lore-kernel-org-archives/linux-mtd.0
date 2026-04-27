Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F8FF8864
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 22:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gQrFSEFkJ9S9YIw3BNiKAXh60aC2lwCWzzKNDU7P8r0=; b=hMjD4SlUcbz7XC
	vo9Y9cmgDxgv59flRS3zQQEBJtyKRF22EZUQcUGKuWZPlyqI7m0jf8t1tewFv92v3tC78I67TaJ8U
	jJZ3YYTHoLMDgx1Ue/Ss68vEE0IH2s8aO/qfoSTgPJpuF3H4RXbkdck+Abwg/nQQgM2VGS/sY2t01
	UQine2ea3EVoZuyICPT/NkEoS0tUVJC9pMwxAfLVPmIpqbk52kVQ1G7kjrKGaGXAfVvx42XJBlnWj
	3HUpZcB993PczeJrpi+yrn2iEifTivnUXsItSgS4U+0bZF5TSPm/qnvnErSPvIg0GY09/UCTz/3aR
	6gLF77bIVeNOZJRx9Mpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHUZq-00000000Gb2-3rav;
	Mon, 27 Apr 2026 22:37:18 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHUZo-00000000Gag-1qcn
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 22:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=G4TJebyN9kRXgObo2vm1WQGlsSKgjr/qAQc6quo3X3Q=; b=jDhPI+1EvImAcBBu2x8E9GV5HM
	6cpqqNAFzVt9qlqOg4IYWj5oH7ydOp5pz5DVCaHR+v+Tb9RdB0hVcYJZg17lo0hHwxEFscYCszkw/
	t98M/+KN+llDgbcmNNN+HJ946wCIKlCSAX9TRTwUVVeypyYralvC4vCNakKqVB90OSvzIl/uxXv9i
	NJQtN+LdI9Dx5aGYF/kXbMhf5ONJLO5BGgyAs71TCB5yrjIWscS0U2BWlptS1byr1lQKRZR/Ikgit
	/04XaCnOpqzAGIrsFBiESo7nuZXkiVebjEXJoQTIFALpHds8eXo7b4xUOXUwqvuTZQbbUIVPX4QJv
	LHfwR2Iw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <bage@debian.org>)
	id 1wHUZl-005oWQ-2S;
	Mon, 27 Apr 2026 22:37:13 +0000
From: Bastian Germann <bage@debian.org>
To: linux-mtd@lists.infradead.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] unittests: fix syscall mocks on 32-bit with time64 glibc
Date: Tue, 28 Apr 2026 00:37:08 +0200
Message-ID: <20260427223711.401029-1-bage@debian.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Debian-User: bage
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_153716_488016_6E938F8D 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 32-bit systems (e.g. armhf), building with -D_FORTIFY_SOURCE=2,
-D_FILE_OFFSET_BITS=64, and -D_TIME_BITS=64 CFLAGS fails many tests.
These flags activate glibc symbol redirects that bypass the --wrap
linker interpositions used by the cmocka mocks:

  - _FORTIFY_SOURCE=2 + _FILE_OFFSET_BITS=64: open(path, flags) -> open64()
  - _FILE_OFFSET_BITS=64: lseek() -> lseek64()
  - _TIME_BITS=64 (glibc >= 2.34): ioctl() -> __ioctl_time64()

Add --wrap entries for each redirected symbol and provide thin forwarders
that delegate to the primary __wrap_open / __wrap_lseek / __wrap_ioctl
functions via plain function calls. This ensures that __func__ inside
those functions resolves correctly for cmocka's expectation lookup.

Signed-off-by: Bastian Germann <bage@debian.org>
---
 tests/unittests/Makemodule.am |  4 ++--
 tests/unittests/test_lib.h    | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/unittests/Makemodule.am b/tests/unittests/Makemodule.am
index 277cac2..7b2ba4d 100644
--- a/tests/unittests/Makemodule.am
+++ b/tests/unittests/Makemodule.am
@@ -1,13 +1,13 @@
 ubilib_test_SOURCES = tests/unittests/libubi_test.c lib/libubi.c
 ubilib_test_SOURCES += tests/unittests/test_lib.h
 ubilib_test_LDADD = $(CMOCKA_LIBS)
-ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek
+ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=open64 -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=__ioctl_time64 -Wl,--wrap=read -Wl,--wrap=lseek -Wl,--wrap=lseek64
 ubilib_test_CPPFLAGS = -O0 --std=gnu99 $(CMOCKA_CFLAGS) -I$(top_srcdir)/include -DSYSFS_ROOT='"$(top_srcdir)/tests/unittests/sysfs_mock"'
 
 mtdlib_test_SOURCES = tests/unittests/libmtd_test.c lib/libmtd.c lib/libmtd_legacy.c
 mtdlib_test_SOURCES += tests/unittests/test_lib.h
 mtdlib_test_LDADD = $(CMOCKA_LIBS)
-mtdlib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek -Wl,--wrap=write
+mtdlib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=open64 -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=__ioctl_time64 -Wl,--wrap=read -Wl,--wrap=lseek -Wl,--wrap=lseek64 -Wl,--wrap=write
 mtdlib_test_CPPFLAGS = -O0 -D_GNU_SOURCE --std=gnu99 $(CMOCKA_CFLAGS) -I$(top_srcdir)/lib/ -I$(top_srcdir)/include -DSYSFS_ROOT='"$(top_srcdir)/tests/unittests/sysfs_mock"'
 
 TEST_BINS = \
diff --git a/tests/unittests/test_lib.h b/tests/unittests/test_lib.h
index cd94d9f..7a5b98b 100644
--- a/tests/unittests/test_lib.h
+++ b/tests/unittests/test_lib.h
@@ -89,6 +89,25 @@ off_t __wrap_lseek(int fd, off_t seek, int whence)
 	return mock_type(off_t);
 }
 
+int __wrap_open64(const char *path, int flags)
+{
+        return __wrap_open(path, flags);
+}
+
+off_t __wrap_lseek64(int fd, off_t offset, int whence)
+{
+        return __wrap_lseek(fd, offset, whence);
+}
+
+int __wrap___ioctl_time64(int fd, unsigned long req, ...)
+{
+        va_list ap;
+        va_start(ap, req);
+        void *arg = va_arg(ap, void *);
+        va_end(ap);
+        return __wrap_ioctl(fd, req, arg);
+}
+
 #define expect_open(X,Y,Z) do { \
 		expect_string(__wrap_open, path, X);\
 		will_return(__wrap_open, Y);\

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
