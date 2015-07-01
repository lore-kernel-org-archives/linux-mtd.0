Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA921-0004JX-FL
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 03:49:53 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <richard.weinberger@gmail.com>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 2/4] mtd-utils: fix 'space before tab in indent' problem
Date: Wed, 1 Jul 2015 11:44:15 +0800
Message-ID: <1435722257-13218-2-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1435722257-13218-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 serve_image.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/serve_image.c b/serve_image.c
index 4f0e946..d3794ec 100644
--- a/serve_image.c
+++ b/serve_image.c
@@ -182,7 +182,7 @@ int main(int argc, char **argv)
 	while (1) for (pkt_nr=0; pkt_nr < total_pkts_per_block; pkt_nr++) {
 
 		if (blockptr && pkt_nr == 0) {
- 			unsigned long amt_sent = total_pkts_per_block * nr_blocks * sizeof(pktbuf);
+			unsigned long amt_sent = total_pkts_per_block * nr_blocks * sizeof(pktbuf);
 			gettimeofday(&now, NULL);
 
 			time_msecs = (now.tv_sec - then.tv_sec) * 1000;
-- 
1.8.4.2
