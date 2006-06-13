Subject: Re: stable oops
From: David Woodhouse <dwmw2@infradead.org>
To: Nickolay <nickolay@protei.ru>
In-Reply-To: <448E920B.3050008@protei.ru>
References: <448E920B.3050008@protei.ru>
Content-Type: text/plain
Date: Tue, 13 Jun 2006 14:04:52 +0100
Message-Id: <1150203892.12423.30.camel@hades.cambridge.redhat.com>
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

On Tue, 2006-06-13 at 14:23 +0400, Nickolay wrote:
> [42949425.260000] kernel BUG at fs/jffs2/readinode.c:353!

static inline int read_unknown(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref, struct jffs2_unknown_node *un)
{
        /* We don't mark unknown nodes as REF_UNCHECKED */
        BUG_ON(ref_flags(ref) == REF_UNCHECKED);


Most strange. Reproduce with CONFIG_JFFS2_FS_DEBUG=1 and make it print
the node type and offset when it triggers that BUG().

-- 
dwmw2
