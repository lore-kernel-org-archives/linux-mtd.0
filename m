Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh3jo-0000Vh-3O
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 08:07:26 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148039861.3199.10.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 16:05:13 +0400
Message-Id: <1148040313.3199.15.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-05-19 at 15:57 +0400, Artem B. Bityutskiy wrote:
> About reading names during scanning.
> 
> The only reason why we read direntry names during scanning is to find
> out which directory entries were deleted. There is no other reason to
> read names.
> 
> Let's think if we may avoid reading direntry names at all. Yes, it is
> possible I think - we just have to postpone this for later. But I don't
> see a simple way do do this. Ideas?
> 
I mean, we don't have to know the right inode refcount values at the
scanning time, may we calculate it at the readinode() time?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
