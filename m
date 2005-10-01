Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELc5S-0008GZ-9C
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 03:48:35 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: dsaxena@plexity.net
In-Reply-To: <20051001050003.GD11137@plexity.net>
References: <20051001050003.GD11137@plexity.net>
Content-Type: text/plain
Date: Sat, 01 Oct 2005 11:46:37 +0400
Message-Id: <1128152797.3546.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [MTD] kmalloc + memzero -> kzalloc conversion
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 22:00 -0700, Deepak Saxena wrote:
> We have the API, so use it.
> 
> Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> 
Well, does it really hurt if one does kmalloc() + memset(zero) instead? Is it worth fixing this? Doubts.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
