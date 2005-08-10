Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2nT1-0002Mc-Qv
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 06:05:50 -0400
Date: Wed, 10 Aug 2005 12:05:57 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Bernhard Priewasser <bernhard@prie.de>
Message-ID: <20050810100557.GA18149@wohnheim.fh-wedel.de>
References: <42F9BA34.6090008@prie.de>
	<20050810083828.GA16583@wohnheim.fh-wedel.de>
	<42F9BF5F.7060603@prie.de> <42F9C28D.4070206@yandex.ru>
	<42F9C4AF.6030505@prie.de> <42F9C612.2050301@yandex.ru>
	<42F9C980.7030301@prie.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42F9C980.7030301@prie.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 August 2005 11:31:44 +0200, Bernhard Priewasser wrote:
>
> To: linux-mtd@lists.infradead.org

Please always reply to all.  I hate to miss interesting stuff, just
because some idiot removed me from the Cc: list.

[ For political correctness' sake.  I didn't call you an idiot yet.
Only if you _continue_ to misbehave in this way, I _will_ call you
that.  So please... ;) ]

> Artem B. Bityuckiy wrote:
> >Bernhard Priewasser wrote:
> >>Ferenc Havasi's improvements are doing well? Confusing...
> >His improvements are going to go into JFFS2 AFAIK
> 
> Ah, OK. To sum up (for my understanding): Ferenc's improvements (mount 
> time, compression) were - beside others - part of JFFS3. JFFS3 design in 
> its current form is not satisfactory, it will be cancelled. Anyway, 
> Ferenc's improvements are good and should/will be merged into JFFS2.
> In parallel, there are some ideas for solving JFFS2 problems like 
> described in the (very nice) "JFFS3 design issues" (scaling: mount time, 
> memory consumption, access time). This will be the "new" JFFS3, current 
> solutions for scaling and stuff are not available or not satisfactory.
> Correct until now? Still a bit confusing :)

The name "JFFS3" ist confusing.  For that very reason, I consider it
rightout harmful to call anything "JFFS3".  Artem has a different
opinion.  It's a free world, everyone has the right to be wrong, if he
so desires. ;)

JFFS has a strictly log-structured design.  JFFS2 is still
log-structured, although not strictly anymore.  You could call it a
chaptered log - strictly log-structured within a chapter, completely
independent chapters.  JFFS3 (the old one, which Artem just removed)
was still supposed to be log-structured.  So the name made sense.  It
was similar in design.

The next flash FS, whatever it will look like, will not be log
structure anymore.  At least, noone I know of is trying to follow that
road anymore.  Log-structuring simply doesn't scale.  Therefore, this
fundamental change in design should not be hidden behind a name like
"JFFS3" - especially since it could also describe the last, failed
approach.

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
