From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1147255421.16853.28.camel@sauron.oktetlabs.ru>
References: <445C476A.2090506@ak.jp.nec.com>
	<1147255421.16853.28.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 10 May 2006 12:06:49 +0100
Message-Id: <1147259209.2794.178.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, joern@wohnheim.fh-wedel.de,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-05-10 at 14:03 +0400, Artem B. Bityutskiy wrote:

> Few suggestions for now (again cosmetic):
> 
> 1. GC-related functions and summary-related functions should be moved to
> gc.c and summary.c

Then they'd need ifdefs. I'd prefer to keep them where they are, in
separate files which aren't compiled if the XATTR options are disabled.

> 2. JFFS2 uses namings we all are used to. E.g., c - JFFS2 superblock
> structure, ref - struct jffs2_node_ref. I've noticed you use 'ref' as
> jffs2_xattr_ref pointers which is just a bit confusing. I would suggest
> you calling them 'xref' - this would improve readability a bit.

Really, I don't think it matters.

> > +		delete_xattr_ref(c, ref);
> > +		delete_xattr_ref(c, xref);

> It's minor, but still.

It's not even 'minor'. It's total bullshit. If you can't look at the
function name "delete_XATTR_REF" and work out what 'ref' is in that
context, then you really shouldn't be trying to read the code. Life is
hard; let's go shopping.

I got annoyed with you when you started on stuff like this in JFFS2
code. Don't start on the XATTR code too.

I do see your point to a _certain_ extent, but let's concentrate on
things that actually matter instead, OK?

> Will you object if I just do some changes I consider useful in xattr
> GIT? Or should I first mail you?

Feel free to make your own tree in ~dedekind/public_git and _ask_ people
to pull from it. Please do not commit directly
to /home/git/jffs2-xattr-2.6 (not that I think you can anyway).

-- 
dwmw2
