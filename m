Received: from mail-pa0-f54.google.com ([209.85.220.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Zdw-0007w6-MY
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 11:53:21 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so1279174pad.27
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 03:52:58 -0800 (PST)
From: Chunyan Zhang <zhang.chunyan@linaro.org>
To: m.chehab@samsung.com, david@hardeman.nu, uli-lirc@uli-eckhardt.de,
 hans.verkuil@cisco.com, julia.lawall@lip6.fr, himangi774@gmail.com,
 khoroshilov@ispras.ru, joe@perches.com, dborkman@redhat.com,
 john.stultz@linaro.org, tglx@linutronix.de, davem@davemloft.net,
 dwmw2@infradead.org, computersforpeace@gmail.com, arnd@linaro.org
Subject: [PATCH 1/3] ktime.h: Introduce ktime_ms_delta
Date: Thu, 18 Dec 2014 19:52:00 +0800
Message-Id: <1418903522-19137-2-git-send-email-zhang.chunyan@linaro.org>
In-Reply-To: <1418903522-19137-1-git-send-email-zhang.chunyan@linaro.org>
References: <ktime-mtd-rc-v1>
 <1418903522-19137-1-git-send-email-zhang.chunyan@linaro.org>
Cc: zhang.lyra@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch introduces a reusable time difference function which returns
the difference in millisecond, as often used in some driver code, e.g.
mtd/test, media/rc, etc.

Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
Acked-by: Arnd Bergmann <arnd@linaro.org>
---
 include/linux/ktime.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/ktime.h b/include/linux/ktime.h
index c9d645a..891ea92 100644
--- a/include/linux/ktime.h
+++ b/include/linux/ktime.h
@@ -186,6 +186,11 @@ static inline s64 ktime_us_delta(const ktime_t later, const ktime_t earlier)
        return ktime_to_us(ktime_sub(later, earlier));
 }
 
+static inline s64 ktime_ms_delta(const ktime_t later, const ktime_t earlier)
+{
+	return ktime_to_ms(ktime_sub(later, earlier));
+}
+
 static inline ktime_t ktime_add_us(const ktime_t kt, const u64 usec)
 {
 	return ktime_add_ns(kt, usec * NSEC_PER_USEC);
-- 
1.7.9.5
