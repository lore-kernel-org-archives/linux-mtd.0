Date: Thu, 13 Jan 2005 18:24:04 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1105640157.5993.11.camel@lap02.tec.linutronix.de>
Message-ID: <Pine.LNX.4.58.0501131821270.17331@phoenix.infradead.org>
References: <41E699F9.10704@redhat.com>
	<1105638483.5993.2.camel@lap02.tec.linutronix.de>
	<41E6B637.9070202@redhat.com>
	<1105640157.5993.11.camel@lap02.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: NAND fail testing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Jan 2005, Thomas Gleixner wrote:

> On Thu, 2005-01-13 at 18:56, David A. Marlin wrote:
> > Thomas Gleixner wrote:
> > 
> > > 
> > > We have blocked the access to short writes. You can do the following:
> > > 
> > > Erase a block from userspace with flash_erase
> > > Write a page of all 0xff except one byte to the first page using
> > > nandwrite
> > > 
> > > Repeat until you get an error
> > 
> > Would this not still 'write' all bytes in the page (even though they are 
> > 0xff and unchanged), causing them to also wear and possibly fail?
> 
> Since the write is only from 1 -> 0 the page write command always
> "writes" all bytes regardless of the number of bytes you have supplied
> before. 
Even with taking into account this, we can not just safely rewrite the 
same page lots of times. If we do so, we can not assume anything about its 
content, even if we write the same every time. Correct me if I'm wrong.

> 
> tglx
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
