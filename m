Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkIF9-0002dd-1b
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 04:02:27 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m33c3widyq.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m33c3widyq.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1089705743.2899.46.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 13 Jul 2004 09:02:24 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-13 at 01:05 -0600, Eric W. Biederman wrote:
> That part does not look to bad...

Would be interesting to know if it works though ... :)

> Although there has been some error handling from cfi_cmdset_0002.c which
> disturbs me.  Seeing as I'm good at finding flaky NOR flash parts...

I assume you mean some error handling _removed_ from cfi_cmdset_0002.c 

I don't recall doing that myself... can you elaborate?
 
> That time line is a bit challenging.  My safe guess was about a week to get
> everything written and tested... 

Yeah, that seems reasonable. I'll sync to Linus this week anyway, then I
can do it again in August when I get back and the dust has settled on
your changes.

-- 
dwmw2
