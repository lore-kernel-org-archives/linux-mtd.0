From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148052379.3199.58.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
	<1148052379.3199.58.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 16:33:11 +0100
Message-Id: <1148052791.3875.180.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 19:26 +0400, Artem B. Bityutskiy wrote:
> 1. During scan nobody can access JFFS2, so "giving incorrect values to
> userspace until we've finished the scan" is wrong.

I shouldn't have said 'scan'. I should have said 'until the GC thread
has finished checking nodes'. 

> 2. Before accessing *any* inode, read_inode() is called. So what I'm
> saying is to calculate *correct* nlink at the read_inode() time.

You can't do that. You don't have correct nlink until you've checked all
the dirents in _all_ the directories on the file system.

> I'm repeating for the 3rd time my statement: names (or their hashes) are
> only needed to calculate correct nlinks. We don't have to calculate
> correct nlinks at the *scan* time, we may try to do this at the
> *read_inode()* time. See what I mean? 

I know what you mean, and it's _still_ not correct.

-- 
dwmw2
