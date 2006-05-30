Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl8iz-00045n-LL
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 14:13:55 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J03003G4BZ1V8B0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 30 May 2006 14:13:49 -0400 (EDT)
Date: Tue, 30 May 2006 14:13:49 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060530174552.GE26220@wohnheim.fh-wedel.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <Pine.LNX.4.64.0605301412030.16927@localhost.localdomain>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_VUxmjtsZi6o2Mf52tAQjeQ)"
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
	<1149003621.2885.185.camel@hades.cambridge.redhat.com>
	<20060530155001.GA26220@wohnheim.fh-wedel.de>
	<1149004893.32620.6.camel@sauron.oktetlabs.ru>
	<20060530161035.GC26220@wohnheim.fh-wedel.de>
	<Pine.LNX.4.64.0605301226001.16927@localhost.localdomain>
	<20060530174552.GE26220@wohnheim.fh-wedel.de>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_VUxmjtsZi6o2Mf52tAQjeQ)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Tue, 30 May 2006, Jörn Engel wrote:

> On Tue, 30 May 2006 12:32:58 -0400, Nicolas Pitre wrote:
> > 
> > I'm firmly with you and so far I agree 100% with your effort.  The 
> > cleanups you're providing are much appreciated.
> > 
> > However Artem might have a point.  You probably should leave mtd->type 
> > alone, at least for now.  It is good to not depend on it anymore but it 
> > probably still has its informative value, just like name string attached 
> > to MTD partitions.  If it should go then it should be removed at the 
> > very end when no one uses it anymore.
> 
> In a way, that is what I do.  mtd->type still exists, although only
> for those types that are still used.  MTD_RAM and MTD_ROM have been
> converted to MTD_GENERIC_TYPE.  In part, that helps me to easily see
> how far I've come with a simple grep.  And in part it prevents others
> from reintroducing new dependencies.  My plan is to remove mtd->type
> completely when every device is of type MTD_GENERIC_TYPE.
> 
> But if there is a general consensus, I can leave that field alone for
> now and hope that people don't introduce new dependencies.

Like you discovered yourself, people tend to duplicate existing code.  
So once enough of the current code is moved away from using mtd->type 
then the probability for new usage added to the tree will go down as 
well.


Nicolas

--Boundary_(ID_VUxmjtsZi6o2Mf52tAQjeQ)--
