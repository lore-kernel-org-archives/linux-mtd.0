Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153JHa-0000IJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 16:13:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B0EE338.1000701@niisi.msk.ru> 
References: <3B0EE338.1000701@niisi.msk.ru>  <3B0E5857.636CBC17@niisi.msk.ru> <11329.990796371@redhat.com> 
To: andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 16:17:36 +0100
Message-ID: <25506.990803856@redhat.com>
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

andreev@niisi.msk.ru said:
> <br><br></pre></blockquote> I know that JFFS is the better choice, but
> I must use the FTL driver, because there is installed X-server on my 
> flash <br> partition... <br>

I don't see the logic. The Compaq iPAQ works quite well with the X-server 
in the JFFS2 filesystem.


>  <br> I think that unlocking of the io_request_lock inside ftl driver
> is not a good idea, because the do_ftl_request must be <br> atomic.

My understanding is that it's perfectly safe to drop the io_request_lock
as long as we only look at the request at the head of the queue. There's no 
need for do_ftl_request to be atomic - and in fact it cannot be atomic 
because the flash read and write calls may sleep.

> What about enabling all or only <br> timer interrupts inside
> do_ftl_request. Can you uncomment the sti() in ftl.c in your CVS
> version?<br> <br> <br> </body></html>

If you ensure that it's correct to do so, and provide a patch which 
releases the io_request_lock, then I'll certainly consider applying it.

--
dwmw2
