Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh6sO-0004qJ-VN
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 11:26:58 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148051254.3199.54.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 19:26:19 +0400
Message-Id: <1148052379.3199.58.camel@sauron.oktetlabs.ru>
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

It;s getting late, I'm doing too many typos. Retype.

On Fri, 2006-05-19 at 19:07 +0400, Artem B. Bityutskiy wrote:
> 1. During scan nobody can access JFFS2, so "giving incorrect values to
> userspace until we've finished the scan" is wrong.
> 2. Before accessing *any* inode, read_inode() is called. So what I'm
> saying is to calculate *correct* nlink at the read_inode() time.
> 
> So, we're still talking about different things. Probably I'm expressing
> my thought horribly.
> 
> You are talking about how to use hashes instead of names. What is
> common, what is not, what do do in case of collisions.
> 
> I'm talking about how to avoid looking at names at all. At hashes too.
> See the difference? No collisions.
> 
> I'm repeating for the 3rd time my statement: names (or their hashes) are
> only needed to calculate correct nlinks. We don't habe to calculate
> correct nlinks at the *scan* time, we may do try to do this at the
> *read_inode()* time. See what I mean? 
> 
1. During scan nobody can access JFFS2, so "giving incorrect values to
userspace until we've finished the scan" is wrong.
2. Before accessing *any* inode, read_inode() is called. So what I'm
saying is to calculate *correct* nlink at the read_inode() time.

So, we're still talking about different things. Probably I'm expressing
my thoughts horribly.

You are talking about how to use hashes instead of names. What is
common, what is not, what to do in case of collisions.

I'm talking about how to avoid looking at names at all. At hashes too.
See the difference? No collisions.

I'm repeating for the 3rd time my statement: names (or their hashes) are
only needed to calculate correct nlinks. We don't have to calculate
correct nlinks at the *scan* time, we may try to do this at the
*read_inode()* time. See what I mean? 

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
