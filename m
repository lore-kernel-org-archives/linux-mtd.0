Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh74a-0005V5-9j
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 11:39:57 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148052791.3875.180.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
	<1148052379.3199.58.camel@sauron.oktetlabs.ru>
	<1148052791.3875.180.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 19:38:55 +0400
Message-Id: <1148053135.3199.63.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-05-19 at 16:33 +0100, David Woodhouse wrote:
> I shouldn't have said 'scan'. I should have said 'until the GC thread
> has finished checking nodes'. 
> 
> > 2. Before accessing *any* inode, read_inode() is called. So what I'm
> > saying is to calculate *correct* nlink at the read_inode() time.
> 
> You can't do that. You don't have correct nlink until you've checked all
> the dirents in _all_ the directories on the file system.
Err... I don't understand. Suppose you've scanned your FS and mounted
it.

Then the 1st call is read_inode("/"). Here you calculate nlink of all
direntries od "/".

The 2nd, say, read_inode("/home"). Here you calculate nlink of all
direntries of "/home".

And so forth. I don't see the problem.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
