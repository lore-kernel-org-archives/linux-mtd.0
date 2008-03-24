Received: from mk-filter-4-a-1.mail.uk.tiscali.com ([212.74.100.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JdvpP-0002Lr-PN
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 23:11:44 +0000
Subject: Re: [PATCH] 2/3 mtd: add support for flash on the SEGA Dreamcast
	Visual Memory Unit
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080324141043.GB2899@logfs.org>
References: <1206211147.6324.48.camel@localhost.localdomain>
	<20080322185600.GE19347@logfs.org>
	<1206207805.6324.13.camel@localhost.localdomain>
	<1206209035.6324.29.camel@localhost.localdomain>
	<20080322183200.GD19347@logfs.org>
	<1206211147.6324.48.camel@localhost.localdomain>
	<20080324020832.GA13935@linux-sh.org>
	<1206360384.6283.11.camel@localhost.localdomain>
	<20080324132101.GA2899@logfs.org>
	<1206367120.6283.15.camel@localhost.localdomain>
	<20080324141043.GB2899@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2008 23:11:21 +0000
Message-Id: <1206400281.10173.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Mundt <lethal@linux-sh.org>, MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-sh <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-03-24 at 15:10 +0100, Jörn Engel wrote:
> On Mon, 24 March 2008 13:58:40 +0000, Adrian McMenamin wrote:
> > 
> > Tempting as it is to continue the war, discretion will be the better
> > part of valour here and I will give you the last word.
> > 
> > Of course I don't mind you sending patches. Indeed it would be very
> > helpful and generous of you to do so.
> 
> Good.  The first four shouldn't change any behaviour.  Number five flips
> positive error returns into negative ones.  I believe the old behaviour
> is a bug.  Worth a second look to make sure.
> 
> All five patches are attached.  Hope that doesn't cause any problems.

Just to keep you informed...

I have patched and tested four of these without any problem.

I haven't patched with the return/goto one as I think that needs more
work.

Other patches (the ones that have a chance of working) will be tested in
due course.
