Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl6nl-0000bf-2k
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:10:56 -0400
Date: Tue, 30 May 2006 18:10:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20060530161035.GC26220@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004893.32620.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1149004893.32620.6.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 May 2006 20:01:33 +0400, Artem B. Bityutskiy wrote:
> 
> I'm absolutely against this trend. You'll soon make all flashes of
> MTD_GENERIC_TYPE, then you'll remove mtd->type altogether.
> 
> We debated about this a lot. And you still didn't explain why I have no
> right to know the  flash type.
> 
> Please, introduce your capabilities stuff, but please, stop removing
> mtd->type implicitly or explicitly. 
> 
> AFAICS, what you're doing now is you're introducing reasonable
> "capabilities" stuff, and slowly removing the mtd->type stuff. Please,
> do one thing.

Artem, for some reason I can't seem to either understand you or change
your mind.  You firmly want to keep mtd->type for a reason I cannot
understand.  And I firmly believe that mtd->type is useless at best
and outright harmful at worst.  Most likely one of us is wrong, but
since we can't reach common grounds, I stopped arguing with you.  It
is pointless, sadly.

If it is me, who is wrong, I hope dwmw2 will show just that.  If my
plans are sound, I hope he will agree and continue to merge patches.

Jörn

-- 
Man darf nicht das, was uns unwahrscheinlich und unnatürlich erscheint,
mit dem verwechseln, was absolut unmöglich ist.
-- Carl Friedrich Gauß
