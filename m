Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEEPW-00086X-KI
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 20:56:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Alice Hennessy <ahennessy@mvista.com>
In-Reply-To: <3F9D8384.ABC9FD4@mvista.com>
References: <3F984931.E6409ED7@mvista.com>
	 <1066981292.29915.584.camel@hades.cambridge.redhat.com>
	 <3F9D6328.547A39A6@mvista.com>
	 <1067284806.16241.2.camel@imladris.demon.co.uk>
	 <3F9D8384.ABC9FD4@mvista.com>
Message-Id: <1067288106.16391.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 27 Oct 2003 20:55:06 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What is wrong with your mail user agent? It's customary to wrap lines at
seventy-something characters; not to wrap them at 90 then again at 70,
giving alternate 70-char and 20-char lines... :)

On Mon, 2003-10-27 at 12:43 -0800, Alice Hennessy wrote:
> The hardware logic uses register access for special commands.  
> Readid,
> status does
> 2 writes to a register, one for address (to distinquish which flash),
> one for
> command and one more
> to read.  Erase takes 2 writes to a register, address then command.  
> The
> out-of-band access
> uses a register to give a command and then the out-of-band data is
> read using
> 
> readb with  offset.

That's just bizarre. I don't think I want to ask _why_ they did this. 

You may be able to massage this into the generic NAND code; you can
override nand_command() completely. I suspect you won't be using much of
the generic code if you do that though. You might end up just writing a
standalone driver.

-- 
dwmw2
