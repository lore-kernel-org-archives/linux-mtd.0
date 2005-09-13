Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EF8G7-0004SD-SJ
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 06:43:42 -0400
Message-ID: <4326AD2D.2070203@yandex.ru>
Date: Tue, 13 Sep 2005 14:42:53 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
In-Reply-To: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Should we put jffs2_sum_marker into eraseblock_header?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> Hi,
> 
> When writing the eraseblock_header patch, I found the current
> summary patch in MTD CVS place jffs2_sum_marker at the end of
> each erase block. Since jffs2_sum_marker is a per-eraseblock
> structure, should we put it into eraseblock_header when the
> eraseblock_header patch is ready in the future?
> 
Yes, it ought to go there IMO.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
