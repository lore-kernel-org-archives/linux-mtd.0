Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYoJ-0003Ie-KS
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 16/24] ubifs: Make r5 hash binary string aware
Date: Thu,  1 Dec 2016 22:21:03 +0100
Message-Id: <1480627271-10441-17-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
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
