Subject: Re: [PATCH 3/3] jffs2: Allow selection of compression mode via a
	sysfs attribute
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Purdie <rpurdie@openedhand.com>
In-Reply-To: <1184059726.6435.31.camel@localhost.localdomain>
References: <1184059726.6435.31.camel@localhost.localdomain>
Content-Type: text/plain
Date: Wed, 11 Jul 2007 16:11:43 +0100
Message-Id: <1184166703.31598.1.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-10 at 10:28 +0100, Richard Purdie wrote: 
> Allow selection of the compression mode for jffs2 via a sysfs
> attribute. This establishes a sysfs presence for jffs2 through
> which other compression options could easily be exported too.

Hm, shouldn't this be per-filesystem rather than global? That way, stuff
like free space tuning &c could be exposed too.

Maybe the compression mode could be done as a mount option anyway?

-- 
dwmw2
