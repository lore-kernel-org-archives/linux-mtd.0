Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl79Q-0001Y9-PS
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:33:11 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J0300MHT7AY69E0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 30 May 2006 12:32:58 -0400 (EDT)
Date: Tue, 30 May 2006 12:32:58 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060530161035.GC26220@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0605301226001.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_5lsDfq9HcVnDzt+Dm3OBSA)"
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004893.32620.6.camel@sauron.oktetlabs.ru>
	<20060530161035.GC26220@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_5lsDfq9HcVnDzt+Dm3OBSA)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Tue, 30 May 2006, Jörn Engel wrote:

> On Tue, 30 May 2006 20:01:33 +0400, Artem B. Bityutskiy wrote:
> > 
> > I'm absolutely against this trend. You'll soon make all flashes of
> > MTD_GENERIC_TYPE, then you'll remove mtd->type altogether.
> > 
> > We debated about this a lot. And you still didn't explain why I have no
> > right to know the  flash type.
> > 
> > Please, introduce your capabilities stuff, but please, stop removing
> > mtd->type implicitly or explicitly. 
> > 
> > AFAICS, what you're doing now is you're introducing reasonable
> > "capabilities" stuff, and slowly removing the mtd->type stuff. Please,
> > do one thing.
> 
> Artem, for some reason I can't seem to either understand you or change
> your mind.  You firmly want to keep mtd->type for a reason I cannot
> understand.  And I firmly believe that mtd->type is useless at best
> and outright harmful at worst.  Most likely one of us is wrong, but
> since we can't reach common grounds, I stopped arguing with you.  It
> is pointless, sadly.
> 
> If it is me, who is wrong, I hope dwmw2 will show just that.  If my
> plans are sound, I hope he will agree and continue to merge patches.

I'm firmly with you and so far I agree 100% with your effort.  The 
cleanups you're providing are much appreciated.

However Artem might have a point.  You probably should leave mtd->type 
alone, at least for now.  It is good to not depend on it anymore but it 
probably still has its informative value, just like name string attached 
to MTD partitions.  If it should go then it should be removed at the 
very end when no one uses it anymore.


Nicolas

--Boundary_(ID_5lsDfq9HcVnDzt+Dm3OBSA)--
