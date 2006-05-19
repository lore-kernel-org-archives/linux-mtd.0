Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh64Y-0003So-Kx
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 10:35:26 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1148041866.3875.145.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
	<1148039931.3199.12.camel@sauron.oktetlabs.ru>
	<1148040679.3875.133.camel@pmac.infradead.org>
	<1148040871.3199.17.camel@sauron.oktetlabs.ru>
	<1148041866.3875.145.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 18:34:49 +0400
Message-Id: <1148049289.3199.38.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-05-19 at 13:31 +0100, David Woodhouse wrote:
> Inode number is going to start low, and will take only two bytes if it's
> less than 16364 -- three bytes up to 2097152. Storing it as an index
> into a table of 'inodes affected by this summary' might also be
> worthwhile, since we'll often have many nodes which belong to the same
> inode.
> 
> Version is also going to start low -- and we can also avoid storing it
> for the second and subsequent nodes belonging to any given inode. We
> _know_ it only counts up by one at a time.
I'd not take seriously a compression which stably degrades with the flow
of time. So, I'd no count version and inode. And I have a feeling that
the gain will not worth the effort, new bugs, new complexities...

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
