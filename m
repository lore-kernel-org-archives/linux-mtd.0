Received: from dsl-64-129-131-125.telocity.com ([64.129.131.125] helo=cfowler.linuxiceberg.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LXnX-0001jE-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 00:26:35 +0100
Subject: Re: X Windows Performance with DOC 2000
From: Christopher Fowler <cfowler@outpostsentinel.com>
To: brendan.simon@ctam.com.au
Cc: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <3D0E8185.2080507@ctam.com.au>
References: <AIEOIMKIOAAJKHJOGAEFMEDLCEAA.david@forcedpotato.com>
	<3D0E8185.2080507@ctam.com.au>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 21 Jun 2002 19:33:02 -0400
Message-Id: <1024702386.27542.23.camel@devel>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I got X to work on DOC 1.5 years ago.  But I used ext2 with compr format
on my DOC2000

Chris

On Mon, 2002-06-17 at 20:40, Brendan J Simon wrote:
> 
> Can you save it to another computer via NFS ?
> 
> 
> David Cooper wrote:
> 
> >Thanks for the tip.
> >
> >I tried this but, of course, the screen goes blank, system hangs and I can
> >never look at the xinit.log file.
> >
> >When I do a hard reboot, this file is gone.
> >
> >Cheers,
> >
> >David Cooper
> >
> >-----Original Message-----
> >From: linux-mtd-admin@lists.infradead.org
> >[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Ilguiz Latypov
> >Sent: Monday, June 17, 2002 6:32 PM
> >To: David Cooper
> >Cc: Linux MTD
> >Subject: RE: X Windows Performance with DOC 2000
> >
> >
> >
> >Will this line log anything meaningful?
> >
> >   xinit > /tmp/xinit.log 2>&1
> >
> >Ilguiz
> >
> >On Mon, 17 Jun 2002, David Cooper wrote:
> >
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
