Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh5nl-00034o-0g
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 10:18:05 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148041434.3875.137.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 18:17:26 +0400
Message-Id: <1148048246.3199.34.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 13:23 +0100, David Woodhouse wrote:
> On Fri, 2006-05-19 at 16:05 +0400, Artem B. Bityutskiy wrote:
> > I mean, we don't have to know the right inode refcount values at the
> > scanning time, may we calculate it at the readinode() time?
> 
> Stop. Look at where we use the _name_. Hint: It's only in
> jffs2_add_fd_to_list(). 
True.

> Observe that we almost never need it, and we can
> actually fetch it from the flash only when we have to.
Let's talk not in 'summary' context. Suppose there is no summary. I'm
talking about how to avoid reading names (and CRC-checking) in this
case. 

WIn the current implementation, we have to read names. At the source
code-level language, because we need nhash at jffs2_add_fd_to_list().

But I'll repeat my statement. The only fundamental reason why we need
names at the scanning time is to provide correct nlink of inodes. This
is because the way how JFFS2 unlinks: it writes direntry with the same
name but with target ino=0.

So, if we'd not read names at the scanning time at all, we'd have no
possibility to calculate correct nlinks. They'd be greater or equivalent
to the correct values. And some dead inodes would no go at scan time.
And my idea: so what? Nothing really bad in this. We'll adjust them
later.

> Ponder whether that's going to be an improvement overall. It means the
> summary shrinks, so takes less space and is faster to read because it
> doesn't contain any names. The down side is that _sometimes_ when
> there's a crc32 collision, you have to actually read the name for some
> nodes from the flash after reading the summary.

So, we can skip reading names. But then we'll have incorrect nlinks
after scanning. And what I'm saying is that it is possible to refine
nlinks at readinode() time.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
