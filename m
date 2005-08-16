Received: from fallback.mail.ru ([194.67.57.14] helo=mx4.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4xY1-000432-3e
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 05:16:03 -0400
Received: from f29.mail.ru (f29.mail.ru [194.67.57.22])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id A11503DDC20
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2005 11:16:59 +0400 (MSD)
From: Timofey Kutergin <tkutergin@mail.ru>
To: J=?koi8-r?Q?=F6?=rn Engel <joern@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Date: Tue, 16 Aug 2005 11:16:47 +0400
In-Reply-To: <20050802121453.GA24417@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Message-Id: <E1E4vgl-000HN8-00.tkutergin-mail-ru@f29.mail.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re[4]: working mphysmap.c
Reply-To: Timofey Kutergin <tkutergin@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi !
I guess removed code is related to command line processing which was incomplete. My code uses just static configuration from Kconfig. We also have newer mphysmap.c code which includes D-cache enabling for selected flash regions. How do you think, is it interesting for inclusion ?

Regards
Timofey


-----Original Message-----
From: Jörn Engel <joern@wohnheim.fh-wedel.de>
To: Timofey Kutergin <tkutergin@mail.ru>
Date: Tue, 2 Aug 2005 14:14:53 +0200
Subject: Re: Re[2]: working mphysmap.c

> 
> On Tue, 2 August 2005 16:12:25 +0400, Timofey Kutergin wrote:
> > 
> > No big deal. I think it may be useful for many people
> 
> It should.  You ripped out quite a bit of code that should stay in,
> but there is relatively little feedback for it.  In fact, you are the
> only person so far.  Guess I should just take your changes and check
> them in.
> 
> Jörn
> 
> -- 
> "Security vulnerabilities are here to stay."
> -- Scott Culp, Manager of the Microsoft Security Response Center, 2001
> 
