From: David Woodhouse <dwmw2@infradead.org>
To: Per Hedblom <per.hedblom@abem.se>
In-Reply-To: <20041109205644.E9EBA37E4D@smtp3-2-sn1.fre.skanova.net>
References: <20041109205644.E9EBA37E4D@smtp3-2-sn1.fre.skanova.net>
Content-Type: text/plain
Message-Id: <1100038945.21273.17.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Tue, 09 Nov 2004 22:22:25 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: eCos gc.c BUG_ON(end > JFFS2_F_I_SIZE(f))
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-11-09 at 21:56 +0100, Per Hedblom wrote:
> The test that fails is BUG_ON(end > JFFS2_F_I_SIZE(f)) in the function
> jffs2_garbage_collect_dnode in gc.c.
> 
> The problem is that the 288(=204+84) bytes latest written are not added to
> the inode->i_size yet but already available in the frag tree.
> 
> 
> I can add code to update the inode->i_size in the jffs2_write_inode_range
> after each successful write but I don't think this is correct to the jffs2
> architecture but it makes the code run.

In Linux, i_size gets updated by the core VFS code, before the call to
commit_write(), and hence before jffs2_write_inode_range() too.

Can we modify jffs2_fo_write() to do likewise?

-- 
dwmw2
