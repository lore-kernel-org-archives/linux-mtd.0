Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Bfc-0003G8-UC
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2012 20:16:41 +0000
Message-ID: <1331560226.12037.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH l2-mtd] jffs2: Fix build when CONFIG_JFFS2_FS_DEBUG > 0
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
Date: Mon, 12 Mar 2012 15:50:26 +0200
In-Reply-To: <1331330354.14442.6.camel@joe2Laptop>
References: <cover.1329349881.git.joe@perches.com>
 <2d68e76db16d42f451370714f03ef952e0839692.1329349881.git.joe@perches.com>
 <1330965033.7220.16.camel@golum> <1330966615.3140.6.camel@joe2Laptop>
 <1331294012.29445.10.camel@sauron.fi.intel.com>
 <1331330354.14442.6.camel@joe2Laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-03-09 at 13:59 -0800, Joe Perches wrote:
> commit c6f6dad20d71 ("jffs2: Standardize JFFS_<LEVEL> uses")
> broke the build when CONFIG_JFFS2_FS_DEBUG > 0.  Similarly,
> commit 41f75c15285c ("jffs2: Convert printks to pr_<level>")
> also broke the build.
> 
> Oops.  Insufficient compile testing...

Folded in and pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
