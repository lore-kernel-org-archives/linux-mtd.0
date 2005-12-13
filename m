Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElxnO-0008HC-Pq
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2005 19:13:41 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <439E0F99.8090008@mvista.com>
References: <438FF22A.2060203@ru.mvista.com> <4390C552.60907@mvista.com>
	<4393D42C.9040303@ru.mvista.com>  <439E0F99.8090008@mvista.com>
Content-Type: text/plain
Date: Tue, 13 Dec 2005 01:20:04 +0100
Message-Id: <1134433204.4205.261.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
	rid of MEMGETOOBSEL/MEMSETOOBSEL
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-12-12 at 16:02 -0800, Todd Poynor wrote:
> > 
> > Well, padding doesn't work in nandwrite if the image to be written 
> > contains OOB data. The idea as I see it is if you are trying to write 
> > the image with OOB data, you should know what you're doing, and that 
> > implies knowledge of the oobavail size.
> > On the other hand, it might be useful to implement an option for 
> > nandwrite which specifies what OOB data length user supposes (default 
> > will be the oobavail).
> 
> In order to make it work as above, we'd need a way for users to find out 
> what oobavail their mtd driver uses (in dmesg and/or a util)

Definitely not by consulting dmesg. There is no guarantee that dmesg
contains the information you need at the time you are asking for it.

> , and an 
> option on all the fs utils to write that number of bytes.  A file format 
> that specifies what data and OOB size have been generated would do the 
> trick, if we want to get that fancy about it.  Just filling out all 16 
> or 64 bytes in the input file and truncating to oobavail at nandwrite 
> time seems a lower-cost workaround.

Find a way to give access to raw data and to the "translated" data is
the goal. Everything else is just an ivory tower experiment.

	tglx
