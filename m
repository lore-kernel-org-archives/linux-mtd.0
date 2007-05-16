Subject: Re: [PATCH] LogFS take three
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20070515133759.9ee434a2.akpm@linux-foundation.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 May 2007 20:07:18 +0800
Message-Id: <1179317240.2859.222.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-05-15 at 13:37 -0700, Andrew Morton wrote:
> But it includes an MTD header file.
> 
> Can this code be tested by people who don't have MTD hardware?  We used to
> ahve a fake-mtd-on-a-blockdev thing, whcih was in a state of some
> disrepair.  Maybe it got repaired.  Or removed.  I can't immediately locate
> it...

There's block2mtd, as Jörn pointed out. There's also 'nandsim' and
'mtdram', which will vmalloc some space and use that to emulate NAND or
NOR flash, respectively.

> It's strange and a bit regrettable that an fs would have dependency on MTD,
> really.

Why? Other file systems has dependencies on BLOCK or on NET. It seems
entirely normal to me.

-- 
dwmw2
