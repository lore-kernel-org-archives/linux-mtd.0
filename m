Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fh3EZ-0007f9-7W
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 07:33:42 -0400
Message-ID: <446DACE8.1000809@yandex.ru>
Date: Fri, 19 May 2006 15:32:56 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
In-Reply-To: <1147999465.13399.33.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Woodhouse wrote:
> It's a little unfortunate that we have to actually keep a second copy of
> the name in the summary. Is there any way we could avoid it?
> 
> One possibility might be to refrain from storing the name in the dirent
> node itself -- store it _only_ in the summary. This could happen only
> during garbage collection -- when we GC a dirent node, we could write it
> out _without_ its name. In fact, we could possibly refrain from writing
> the GC'd dirent to the log at all -- put it _only_ in the summary.
> 
> That does break backwards compatibility though, which isn't ideal.
And it's just bad:

o it's hacky;
o it'll introduce many if()s in code and make it even more copmplecated;
o finally, it'll interfer robustness: if the summary node get's 
corrupted, we may loose a lot - not just one node;

I believe that this approach has to be vetoed.

> Another possibility might be to omit the full name from the summary, but
> to store only the hash (or name_crc) instead. We hardly ever actually
> need the full name -- it's only used if there's a hash collision, in
> jffs2_add_fd_to_list().
Good idea.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
