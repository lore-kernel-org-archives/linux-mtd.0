Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQQDb-0004am-L4
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2005 09:35:16 -0400
Message-ID: <426E439A.2050301@inf.u-szeged.hu>
Date: Tue, 26 Apr 2005 15:35:22 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <loom.20050413T142519-107@post.gmane.org>	<425E3174.4030308@inf.u-szeged.hu>	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>	<loom.20050420T165531-253@post.gmane.org>	<4267B8EF.6000803@inf.u-szeged.hu>
	<1114097490.21485.1.camel@sauron.oktetlabs.ru>
In-Reply-To: <1114097490.21485.1.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem!

Artem B. Bityuckiy wrote:

>Because what your option does is
>
>+#ifdef CONFIG_JFFS2_SUMMARY_NOCRCCHECK	
>+	ic->state = INO_STATE_CHECKEDABSENT;
>+#endif
>
>which is incorrect. You should not skip the checking process for inodes.
>When I proposed not to check CRCs I meant another thing. And now I'm
>uncertain that what I proposed is absolutely correct.
>
>Please, bear in mind that the primary goal of the checking process is
>not to check CRCs but rather to detect which nodes are valid, which are
>obsolete. This is done by building fake fragtrees.
>
>Correct me if I'm wrong.
>  
>
I think our nocrc support works fine, and it is correct.

Everything is checkd and built but not at mount time. It will be checked
at the moment when you want to use the inode:

Mount:
Function jffs2_do_crccheck_inode() calls jffs2_do_read_inode_internal(),
which calls jffs2_get_inode_nodes() to collect some necessary info and
do sanity checks (crc, page boundary, ...).
After then jffs2_get_inode_nodes() can appoint which node is valid and
which is obsolated.

Read:
If you want to read an inode then the kernel calls jffs2_do_read_inode()
to get the inode.
jffs2_do_read_inode() checks that the inode is in which state
(UNCHECKED, CHECKEDABSENT, PRESENT, CHECKING, ...) In our point of view
state UNCHECKED and CHECKEDABSENT are the same, it means that in both
cases it calls jffs2_do_read_inode_internal().

In both situation nodes are checked.

I think it is necessery because if you mount the fs as readonly these
checks should happen.

Zoltan Sogor
