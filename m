Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQN-0008O8-Ma
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:07 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Willem de Bruijn <willemb@google.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Florian Westphal <fw@strlen.de>,
 WANG Cong <xiyou.wangcong@gmail.com>, Julian Anastasov <ja@ssi.bg>,
 Ido Schimmel <idosch@mellanox.com>
Subject: [PATCH v2 29/53] net: skbuff.h: properly escape a macro name on
 kernel-doc
Date: Tue, 16 May 2017 09:16:21 -0300
Message-Id: <771b00a84be46d10e3f74af2d86d226302c907c5.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The "%" escape code of kernel-doc only handle letters. It
doesn't handle special chars. So, use the ``literal``
notation. That fixes this warning:

./include/linux/skbuff.h:2695: WARNING: Inline literal start-string without end-string.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 include/linux/skbuff.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index a098d95b3d84..25b1659c832a 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -2691,7 +2691,7 @@ bool skb_page_frag_refill(unsigned int sz, struct page_frag *pfrag, gfp_t prio);
  * @offset: the offset within the fragment (starting at the
  *          fragment's own offset)
  * @size: the number of bytes to map
- * @dir: the direction of the mapping (%PCI_DMA_*)
+ * @dir: the direction of the mapping (``PCI_DMA_*``)
  *
  * Maps the page associated with @frag to @device.
  */
-- 
2.9.3
