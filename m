Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hqrno-0002c9-Vn
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 10:27:02 -0400
Date: Wed, 23 May 2007 14:58:41 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Subject: Re: Review status (Re: [PATCH] LogFS take three)
Message-ID: <20070523125840.GC24738@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515152149.GB32059@lazybastard.org>
	<20070517160308.GA26643@2ka.mipt.ru>
	<20070517171017.GB15676@lazybastard.org>
	<20070520173049.GA20907@2ka.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070520173049.GA20907@2ka.mipt.ru>
Cc: akpm@osdl.org, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 20 May 2007 21:30:52 +0400, Evgeniy Polyakov wrote:
> 
> In that case segment size must be more than 32 bits, or below
> transformation will not be correct?

Must it?  If segment size is just 20bit then the filesystem may only be
52bit.  Or 51bit when using signed values.

> segsize is long, but should be u64 I think.

It could be s32 as well.

> static void fixup_from_wbuf(struct super_block *sb, struct logfs_area
> 	*area, void *read, u64 ofs, size_t readlen)
> 
> u32 read_start = ofs & (super->s_segsize - 1);
> u32 read_end = read_start + readlen;
> 
> And this can overflow, since readlen is size_t.

Theoretically yes.  Practically readlen is bounded to sb->blocksize plus
one header.  I'll start worrying about that when blocksize approaches
32bit limit.

> > If anyone can find similar bugs, the bounty is a beer or non-alcoholic
> > beverage of choice. :)
> 
> Stop kiling your kidneys, your health and promote such antisocial style
> of life, start drinking vodka instead.

I'm just a German.  Forgive me if I drink lesser beverages.

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
