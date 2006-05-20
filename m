Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FhMzR-0005XQ-KH
	for linux-mtd@lists.infradead.org; Sat, 20 May 2006 04:39:32 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148053436.3875.190.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
	<1148052379.3199.58.camel@sauron.oktetlabs.ru>
	<1148052791.3875.180.camel@pmac.infradead.org>
	<1148053135.3199.63.camel@sauron.oktetlabs.ru>
	<1148053436.3875.190.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Sat, 20 May 2006 12:38:38 +0400
Message-Id: <1148114318.3199.76.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-05-19 at 16:43 +0100, David Woodhouse wrote:
> Q: What affects nlink? If there's a file 'foo' in the '/' directory,
> which is inode #365 -- where do you look for dirents which might affect
> the nlink of that inode #365?

One more idea that came to my mind today: your approach with nhashes
seems good, but it has one drawback - collisions. They may be rare, but
we'll anyway deal with them - more code, more testing.

How about to introduce "direntry IDs"? Just 32 bit values, constantly
incremented, per-inode. They'd act instead of names. We'd not need names
at all, as those IDs would play their role. Advantages of fixed-width
IDs vs variable length names are obvious.

I suspect it'd simplify and improve many things, but I'm not sure we
could make it compatible.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
