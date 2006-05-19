From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148049289.3199.38.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
	<1148039931.3199.12.camel@sauron.oktetlabs.ru>
	<1148040679.3875.133.camel@pmac.infradead.org>
	<1148040871.3199.17.camel@sauron.oktetlabs.ru>
	<1148041866.3875.145.camel@pmac.infradead.org>
	<1148049289.3199.38.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 15:59:46 +0100
Message-Id: <1148050786.3875.175.camel@pmac.infradead.org>
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

On Fri, 2006-05-19 at 18:34 +0400, Artem B. Bityutskiy wrote:
> I'd not take seriously a compression which stably degrades with the
> flow of time. So, I'd no count version and inode. And I have a feeling
> that the gain will not worth the effort, new bugs, new complexities...

Do we have current figures on how much space the summary nodes actually
take?

What I'd actually do, rather than storing inode number and version just
like that, is have a table stored in the summary, containing tuples of
inode number, and the first version number of that inode which is used.
The actual node entries in the summary would then just contain an index
into that table for the inode number, and an offset for the version.

So if we have an eraseblock which contains the following nodes...

	{ ino# 143454, version# 2341 }
	{ ino# 143454, version# 2342 }
	{ ino# 143454, version# 2343 }
	{ ino# 209343, version# 342 }
	{ ino# 143454, version# 2344 }
	{ ino# 209343, version# 343 }

... that would be represented as a table containing
[0]:	{ ino #143454, first version# 2341 }
[1]:	{ ino #209343, first version# 342 }

... followed by actual summary entries which just refer to that table,
having { index into inode table, offset from first version } tuples...

	{ 0, 0 }
	{ 0, 1 }
	{ 0, 2 }
	{ 1, 0 }
	{ 0, 3 }
	{ 1, 1 }

And in that case, the numbers _would_ compress reliably, even on old
file systems. 

I wonder if using something like rtime would work for compressing
summary blocks, rather than a specific integer encoding...

-- 
dwmw2
