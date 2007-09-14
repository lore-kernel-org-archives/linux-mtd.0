Subject: Re: JFFS2 ACL problem.
From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <46EA2743.3090107@ak.jp.nec.com>
References: <1186676611.7282.47.camel@shinybook.infradead.org>
	<46C9783D.4000503@ak.jp.nec.com>
	<1187782861.22432.81.camel@pmac.infradead.org>
	<46D25ECF.8090409@ak.jp.nec.com>  <46EA2743.3090107@ak.jp.nec.com>
Content-Type: text/plain
Date: Fri, 14 Sep 2007 08:40:50 +0200
Message-Id: <1189752050.3241.16.camel@shinybook.infradead.org>
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

On Fri, 2007-09-14 at 15:16 +0900, KaiGai Kohei wrote:
> 
> The attached patch separate jffs2_init_acl() into two parts.
> 
> The one is jffs2_init_acl_pre() called from jffs2_new_inode().
> It compute ACL oriented inode->i_mode bits, and allocate in-memory ACL
> objects associated with the new inode just before when inode meta
> infomation is written to the medium.
> 
> The other is jffs2_init_acl_post() called from jffs2_symlink(),
> jffs2_mkdir(), jffs2_mknod() and jffs2_do_create().
> It actually writes in-memory ACL objects into the medium next to
> the success of writing meta-information.
> 
> In the current implementation, we have to write a same inode meta
> infomation twice when inode->i_mode is updated by the default ACL.
> However, we can avoid the behavior by putting an updated i_mode
> before it is written at first, as jffs2_init_acl_pre() doing.
> 
> Please review this patch.

At first glance, that looks much nicer than what I did -- thanks.

I should hopefully have some time later today to take a closer look and
merge it.

-- 
dwmw2
