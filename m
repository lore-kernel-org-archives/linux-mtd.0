Received: from gateway.innominate.fta-berlin.de ([141.16.74.40] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eboL-0004TB-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 14:06:29 +0000
Date: Fri, 31 Jan 2003 15:19:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Christian =?iso-8859-1?Q?Hohnst=E4dt?= <chohnstaedt@innominate.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Pushing code to 2.4.x
Message-ID: <20030131141946.GA22399@tkeitel001.bln.gelonet.local>
Mime-Version: 1.0
Content-Type: text/PLAIN; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3wuknzlp4.fsf@lnxi.com>
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

On 29 Jan 2003, Eric W. Biederman wrote:

> What is the plan for keeping the kernel and the CVS tree more or less in
> sync?

It goes in cycles...
	1. I sync to Marcelo/Linus
	2. People commit changes.
	3. Those changes stabilise and I become happy with them.
	4. I plan to find time to sync to Marcelo/Linus again.
	5. People bitch at me because it's out of sync.
	6. I say "I'll find some time soon, honest".
	7. Red Hat finds me more 'real work' to do just when I thought
	   I'd got some slack some in the Engineering Schedule.
	8. People bitch at me some more.
	9. I eventually get round to it.

> There are currently some large divergences, to the point there are some
> chips that I can use the cfi_cmdset_0002.c from the stable 2.4.x kernel
> mtd tree but not from the recent CVS tree.

That's a bit of a bugger -- because I sent the CVS code to Marcelo this 
week :) Care to enlighten us on the problems you've seen?

> For the short term I can release and maintain patch where everything works,
> the question is what should my long term strategy be.
> 
> A) Push to the MTD cvs repository and let David Woodhouse push to Marcelo.

As you've observed, there's a lag involved with this. If you're willing to
help reduce that I'm happy.

> B) Push to the MTD cvs repository and push directly to Marcelo.

This is fine by me assuming the following:

	1. You commit to CVS first and then send to Marcelo, including
	   the appropriate $Id$ changes so I know which version 
	   Marcelo was last sync'd with.
	2. You Cc me.
	3. Your changes are correct for both 2.4 and 2.5. I don't care
	   if they're tested, as long as they're correct :)
	4. You merge changes from Marcelo's tree into CVS too, before
	   sending it back to him.

> With LinuxBIOS becoming a fully supported product I expect to continually
> have more board and more little rom chips that I am making certain work.

For new map drivers, and new IDs for the chip drivers, please do commit to 
CVS and send to Marcelo simultaneously. I'm perfectly happy with that.

-- 
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
