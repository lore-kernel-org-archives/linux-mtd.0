Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161qYJ-0003Rg-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 14:53:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <82B1591A280FD411B91200D0B75B484A015F5D4D@sis-uk-msg01.altera.com> 
References: <82B1591A280FD411B91200D0B75B484A015F5D4D@sis-uk-msg01.altera.com> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel protection register read 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Nov 2001 15:02:18 +0000
Message-ID: <24871.1005231738@redhat.com>
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

cdavies@altera.com said:
>  Hmm, this is a problem. Am I correct in thinking that the code only
> reads the cfi tables from the first device and assumes that any
> additional devices are of the same type? (That's what it looks like to
> me) If so there is no way to read the protection register data from
> subsequent devices. 

You can do whatever you like in ->read_prot_reg(), so there's nothing that 
prevents you from doing this.

>  I reckon the best way to handle the multiple/interleaved chip
> configuration would be to concatenate all the protection registers
> together into one block. All the other interfaces I can think of would
> require a chip number to be passed in, which doesn't seem that nice to
> me. Does that sound reasonable?

Seems like a sane approach to me. We possibly need to couple it with a way
to query the size of protection register data available. 

> > Also, isn't it possible to _write_ to the user areas of the chips?
> 
> Yes it is, but I haven't implemented that because I don't need it. If
> adding writes is a condition for getting read functionality into cvs
> then I can do that too. 

Implementing it isn't absolutely necessary, although it would be nice. We 
do have to make sure that the framework is sane, and whoever _does_ finally 
implement writes isn't going to have to change stuff around for it, though.

--
dwmw2
