Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELcND-0000Fm-1n
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 04:06:37 -0400
Message-ID: <433E432B.7010406@yandex.ru>
Date: Sat, 01 Oct 2005 12:04:59 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: dsaxena@plexity.net
References: <20051001050003.GD11137@plexity.net>
	<1128152797.3546.15.camel@sauron.oktetlabs.ru>
	<20051001080027.GM25424@plexity.net>
In-Reply-To: <20051001080027.GM25424@plexity.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [MTD] kmalloc + memzero -> kzalloc conversion
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Deepak Saxena wrote:
> I see it more as an API usage cleanup then a "fix" of any sort. 
> 
Well, actually it may be helpful in only future, for example, if it is 
known that the allocated memory is zero-filled already, memzero() may be 
avoided at all.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
