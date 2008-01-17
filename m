Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080117162601.GA6677@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jan 2008 07:22:21 +0800
Message-Id: <1200612141.14882.83.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-01-17 at 17:26 +0100, Jörn Engel wrote:
> 
> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
> sure who cares enough to look at this.  My approach would be to 
> $ echo t > /proc/sysrq_trigger
> several times during those 12 minutes and take a close look at the
> code
> paths showing up.  Most likely it will spend 99% of the time in one
> place.

I was going to suggest booting with 'profile=1' and using readprofile,
which is a slightly more reliable way of getting the same information.

-- 
dwmw2
