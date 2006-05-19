Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh3cW-0008G0-DS
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 07:58:27 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1147999465.13399.33.camel@shinybook.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 15:57:41 +0400
Message-Id: <1148039861.3199.10.camel@sauron.oktetlabs.ru>
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

On Fri, 2006-05-19 at 01:44 +0100, David Woodhouse wrote:
> Another possibility might be to omit the full name from the summary, but
> to store only the hash (or name_crc) instead. We hardly ever actually
> need the full name -- it's only used if there's a hash collision, in
> jffs2_add_fd_to_list().

About reading names during scanning.

The only reason why we read direntry names during scanning is to find
out which directory entries were deleted. There is no other reason to
read names.

Let's think if we may avoid reading direntry names at all. Yes, it is
possible I think - we just have to postpone this for later. But I don't
see a simple way do do this. Ideas?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
