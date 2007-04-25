Subject: Re: OOPS at mount
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1177516583.5073.22.camel@gentoo-jocke.transmode.se>
References: <1177513779.5073.9.camel@gentoo-jocke.transmode.se>
	<1177514597.2755.251.camel@pmac.infradead.org>
	<1177515648.5073.14.camel@gentoo-jocke.transmode.se>
	<1177515855.2755.252.camel@pmac.infradead.org>
	<1177516583.5073.22.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 25 Apr 2007 17:07:38 +0100
Message-Id: <1177517258.2755.261.camel@pmac.infradead.org>
Mime-Version: 1.0
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

I've just committed something to the git tree which should fix the
symptoms --and I think it should apply OK to 2.6.20 which predates other
improvements in read_inode(). 

We should still work out the _cause_ though. Once you've confirmed that
this patch avoids the crash, you'll know the inode number (because it'll
bitch about it). If you don't want to wait for a full
CONFIG_JFFS2_FS_DEBUG=1 run, can you enable all the output in
jffs2_get_inode_nodes() _just_ for that inode, and show me what nodes
are found?

It sounds like some nodes have gone missing, leaving you with _only_ a
metadata node -- with no data of its own, just other inode information
including a non-zero i_size.

-- 
dwmw2
