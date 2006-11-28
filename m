Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gp1ce-0004BE-4p
	for linux-mtd@lists.infradead.org; Tue, 28 Nov 2006 11:59:38 +0000
Date: Tue, 28 Nov 2006 12:58:10 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: dedekind@infradead.org
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
Message-ID: <20061128125810.306e7d54@dhcp-252-105.norway.atmel.com>
In-Reply-To: <1163404009.3925.26.camel@sauron>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1163404009.3925.26.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 13 Nov 2006 09:46:49 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Wed, 2006-11-01 at 11:52 +0100, Haavard Skinnemoen wrote:
> > jffs2_flash_writev(): Non-contiguous write to 00825300
> > wbuf was previously 00825300-008253b8
>
> So all it seems that you need to to make jffs2_can_mark_obsokete()
> return 0 in case of dataflash.

That seems to work. Thanks, and sorry for taking so long to respond to
this.
---
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: [PATCH] MTD: jffs2_can_mark_obsolete() should return 0 for dataflash

Attempting to write something to a file on a jffs2 filesystem using
mtd_dataflash often results in the following BUG:

jffs2_flash_writev(): Non-contiguous write to 00825720
wbuf was previously 00825300-0082530c
kernel BUG at /home/hskinnemoen/git/linux-devel/fs/jffs2/wbuf.c:786!

Fix this by returning 0 from jffs2_can_mark_obsolete() when running
on top of dataflash.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 fs/jffs2/os-linux.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 9f41fc0..a037fa4 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -106,7 +106,8 @@ static inline void jffs2_init_inode_info
 #ifdef CONFIG_JFFS2_SUMMARY
 #define jffs2_can_mark_obsolete(c) (0)
 #else
-#define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
+#define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE)	\
+				    && !jffs2_dataflash(c))
 #endif
 
 #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
-- 
1.4.3.3
