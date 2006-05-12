From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@kaigai.gr.jp>
In-Reply-To: <4464A7B1.4070605@kaigai.gr.jp>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
	<445EA6D4.5000909@ak.jp.nec.com>
	<1147092567.2766.146.camel@pmac.infradead.org>
	<4460BEEE.2070704@ak.jp.nec.com>  <4463C5B8.1070708@kaigai.gr.jp>
	<1147390288.12030.16.camel@shinybook.infradead.org>
	<4464A7B1.4070605@kaigai.gr.jp>
Content-Type: text/plain
Date: Fri, 12 May 2006 16:38:32 +0100
Message-Id: <1147448312.2794.421.camel@pmac.infradead.org>
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

On Sat, 2006-05-13 at 00:20 +0900, KaiGai Kohei wrote:
> Sorry, it's translated by terminal emulator automatically.
> The patch keeps consistency of tabs in the indenting.

OK, that's good.

> OK, I'll pay attention to attach 'JFFS2' to the subject.
> But nine of previous patches which have been already commited did not
> attach such a keyword. Is it necessary to update the subject of them ?
> (But I don't know how to operate for this. Hmm...) 

It is possible, I think -- the 'cg-admin-rewritehist' tool in Cogito
allows it. Alternatively, it's easy enough to cherry-pick patches from
git and apply them to a new branch, then make that new branch your
'master'. If you do this, remember to push with the '--force' option so
that your new tree overwrites the remote.

If you like, we can leave the XATTR tree as it is, and import it as a
patch instead of with git-pull. Then the history doesn't matter.

-- 
dwmw2
