Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqZWg-00088H-JP
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 20:00:40 +0000
Message-ID: <48162CD0.4070702@users.sourceforge.net>
Date: Mon, 28 Apr 2008 22:00:16 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions	causes
	kernel panic
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>	<1208011719.2698.19.camel@pmac.infradead.org>	<Pine.LNX.4.64.0804141650100.15842@pentafluge.infradead.org>	<Pine.LNX.4.64.0804141800170.15842@pentafluge.infradead.org>	<4810F73A.5000305@users.sourceforge.net>	<1209075315.11578.9.camel@shinybook.infradead.org>
	<48120242.9020908@users.sourceforge.net>
In-Reply-To: <48120242.9020908@users.sourceforge.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders Grafström wrote:
> The panic occurs at fs/jffs2/file.c:251 which is
> BUG_ON(!PageUptodate(pg));
> 
> Data CRC 33c102e9 != calculated CRC 0ef77e7b for node at 005d42e4

I think this issue might be a sideeffect of (or related to) the erase suspend problems
I'm having. Sometimes there are data CRC errors.
The error is propagated upwards from jffs2_read_dnode to jffs2_do_readpage_nolock
which calls ClearPageUptodate and returns 0 then jffs2_write_end traps on !PageUptodate.

I hope this illustrates the scenario:

jffs2_write_begin {
     jffs2_do_readpage_nolock {
         jffs2_read_inode_range {
             jffs2_read_dnode -> Data CRC 33c102e9 != calculated CRC 0ef77e7b for node at 005d42e4
         }
         ClearPageUptodate(pg);
         return 0
     }
}

jffs2_write_end {
     BUG_ON(!PageUptodate(pg));
}

Should the error value perhaps be forwarded upwards?
Would that inadvertently prevent a broken node from being replaced by a new one?

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 5e92034..a146bf4 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -99,7 +99,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
  	kunmap(pg);

  	D2(printk(KERN_DEBUG "readpage finished\n"));
-	return 0;
+	return ret;
  }

  int jffs2_do_readpage_unlock(struct inode *inode, struct page *pg)
