Subject: Re: [RFC] BUG Power loss recovery issues in JFFS2
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0711161123200.1241@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
	<1195071456.2533.45.camel@shinybook.infradead.org>
	<20071115122042.GA10165@lazybastard.org>
	<1195194827.2533.79.camel@shinybook.infradead.org>
	<Pine.LNX.4.64.0711161040540.30610@pentafluge.infradead.org>
	<Pine.LNX.4.64.0711161123200.1241@pentafluge.infradead.org>
Content-Type: text/plain
Date: Fri, 16 Nov 2007 22:06:35 -0500
Message-Id: <1195268795.2533.166.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roman.borisov@intel.com, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -37,8 +37,10 @@ static int check_node_data(struct jffs2_sb_info *c, struct jffs2_tmp_dnode_info
 
        BUG_ON(tn->csize == 0);
 
-       if (!jffs2_is_writebuffered(c))
+       if (!jffs2_is_writebuffered(c)) {
+               printk("Er, let's just skip out of %s without actually checking. Who thought that was a good idea?\n", __func__);
                goto adj_acc;
+       }
 
        /* Calculate how many bytes were already checked */
        ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);

-- 
dwmw2
