Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hu7Cb-0003JM-7O
	for linux-mtd@lists.infradead.org; Fri, 01 Jun 2007 09:30:04 -0400
Subject: Re: GC starves write's in 2.6.20
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1180699899.26803.671.camel@pmac.infradead.org>
References: <1180622517.1468.246.camel@gentoo-jocke.transmode.se>
	<1180699899.26803.671.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Jun 2007 15:29:59 +0200
Message-Id: <1180704599.1468.287.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-01 at 13:11 +0100, David Woodhouse wrote:
> On Thu, 2007-05-31 at 16:41 +0200, Joakim Tjernlund wrote:
> > We have noticed that deleting some 50 files, some a few MB big, in our
> > JFFS2 FS and then directly start downloading a large rpm file sometimes
> > stalls a write(2) call 10-15 secs, possibly more. The GC process is
> > running and it appears to be blocking the write(2). However the FS is
> > just 50-60% full so I don't think stalling writes for that long time is
> > justified. These long delays causes a timeout in the tftp demon and
> > the transmission is aborted. Any ideas? 
> 
> Hm. What's the GC process actually doing? If you kill it, does the file
> system still run GC in the context of the processes which are writing?
> 

Sorry, that was bit premature. It was pdflush that was running most of
the time. GC was running also but only for a short while. Then I
remebered Radoslaw's patch and tried it and the problem was gone.

 Jocke
