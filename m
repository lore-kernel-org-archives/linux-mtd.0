Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62Ew-00055z-5q
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:23:05 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 21/29] ubifs: Make r5 hash binary string aware
Date: Sun, 13 Nov 2016 22:21:04 +0100
Message-Id: <1479072072-6844-22-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of now all filenames known by UBIFS are strings with a NUL
terminator. With encrypted filenames a filename can be any binary
string and the r5 function cannot search for the NUL terminator.
UBIFS always knows how long a filename is, therefore we can change
the hash function to iterate over the filename length to work
correctly with binary strings.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/key.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index c0a95e393347..ca4371fdfa7d 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -69,7 +69,7 @@ static inline uint32_t key_r5_hash(const char *s, int len)
 	uint32_t a = 0;
 	const signed char *str = (const signed char *)s;
 
-	while (*str) {
+	while (len--) {
 		a += *str << 4;
 		a += *str >> 4;
 		a *= 11;
-- 
2.7.3
