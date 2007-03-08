Subject: Re: JFFS2 OOPS in 2.6.20
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1173375879.26465.13.camel@gentoo-jocke.transmode.se>
References: <1173374059.26465.4.camel@gentoo-jocke.transmode.se>
	<1173375204.26465.8.camel@gentoo-jocke.transmode.se>
	<1173375879.26465.13.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 18:37:27 +0000
Message-Id: <1173379047.3461.482.camel@pmac.infradead.org>
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

On Thu, 2007-03-08 at 18:44 +0100, Joakim Tjernlund wrote:
> Got another board too that has an identical OOPS, but prints 
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> {0040,4001,00000044,00000000}
> Just before the OOPS, here is the full OOPS:
> JFFS2 notice: (137) jffs2_get_inode_nodes: Node header CRC failed at 0x3aa87a0. 
> {0040,4001,00000044,00000000}
> ------------[ cut here ]------------
> kernel BUG at fs/jffs2/readinode.c:376! 

Can you make it print the flash offset of the offending node, and the
header contents (like the 0040,4001,00000044,00000000 above) before
dying? Then reproduce with CONFIG_JFFS2_FS_DEBUG=1 and show me the full
output.

-- 
dwmw2
