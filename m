Received: from rwcrmhc12.comcast.net ([216.148.227.85])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELcNL-0000Fq-QK
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 04:06:43 -0400
Date: Sat, 1 Oct 2005 01:00:27 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20051001080027.GM25424@plexity.net>
References: <20051001050003.GD11137@plexity.net>
	<1128152797.3546.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1128152797.3546.15.camel@sauron.oktetlabs.ru>
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [MTD] kmalloc + memzero -> kzalloc conversion
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Oct 01 2005, at 11:46, Artem B. Bityutskiy was caught saying:
> On Fri, 2005-09-30 at 22:00 -0700, Deepak Saxena wrote:
> > We have the API, so use it.
> > 
> > Signed-off-by: Deepak Saxena <dsaxena@plexity.net>
> > 
> Well, does it really hurt if one does kmalloc() + memset(zero) instead? Is it worth fixing this? Doubts.

I see it more as an API usage cleanup then a "fix" of any sort. 

~Deepak

-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

Even a stopped clock gives the right time twice a day.
