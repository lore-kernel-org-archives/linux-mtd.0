Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvFi4-0000t6-0f
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 10:38:35 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DvFgT-0003am-Tm
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 16:36:30 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 16:36:29 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jul 2005 16:36:29 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Wed, 20 Jul 2005 16:34:40 +0200
Message-ID: <dblne1$cgd$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>	<dblm4l$802$1@sea.gmane.org>
	<1121869156.12903.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1121869156.12903.19.camel@localhost.localdomain>
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>So you think this is what consumes the time?
> Quite feasibly. You spoke of a multi-megabyte file, and the performance
> on such files is definitely a lot better than it was. 
I just find it strange that this problem suddenly occur out of 
nowhere... I've been working with these big files many many times before 
this happened.
And I've tried reproducing it on another device by copying, moving, and 
deleting these 11megs of files back and forth... But no matter what I 
do, I get nothing resembling this behaviour...
I guess "fragmentation" has a saying here?!

> Run it with profiling and we'll see -- tell us where it's spending
> all its time, and we'll see if we can improve that part of the code.
I'm not comfortable with profiling the kernel... It could be arranged, 
but I rather see if the a recent CVS snapshot does it for me... ;-)

// Martin
