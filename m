From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@kaigai.gr.jp>
In-Reply-To: <4463C5B8.1070708@kaigai.gr.jp>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
	<445EA6D4.5000909@ak.jp.nec.com>
	<1147092567.2766.146.camel@pmac.infradead.org>
	<4460BEEE.2070704@ak.jp.nec.com>  <4463C5B8.1070708@kaigai.gr.jp>
Content-Type: text/plain
Date: Fri, 12 May 2006 00:31:27 +0100
Message-Id: <1147390288.12030.16.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jmorris@redhat.com, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	russell@coker.com.au, linux-mtd@lists.infradead.org,
	lorenzo@gnu.org, sds@tycho.nsa.gov,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-12 at 08:16 +0900, KaiGai Kohei wrote:
> 
> The pre-patched implementation ignores this error code and
> doesn't care. Theredore, total process of FS-mounting failed.
> This patch fixes this problem, When we found such a obsolete
> node, it will be dealt as a DIRTY_SPACE() and FS-mounting
> will be continued.
> 
> It works correctly, and I belive this solution is right. 

It does look correct to me. The patch seems to highlight some
inconsistency of tabs vs. spaces in the indenting though.

When committing to the a git tree, please remember that if I pull from
it and then Linux pulls from it, the 'subject' of your commit should be
meaningful in that context. So it should mention 'JFFS2' at the very
least.

That's probably not quite so important for your jffs2-xattr tree, since
I think I'll probably import that as a _patch_ when we're ready, rather
than just pulling the whole thing. But in general, it's a useful thing
to remember for people committing to git trees and expecting me to pull
from them.

-- 
dwmw2
