Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JxSP-0001KN-KO
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 16:30:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: kusdogan@boun.edu.tr
In-Reply-To: <1053887191.3ed10ad7ea7cf@webmail.boun.edu.tr>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
	 <1053855854.2082.3.camel@passion.cambridge.redhat.com>
	 <1053887191.3ed10ad7ea7cf@webmail.boun.edu.tr>
Message-Id: <1053876687.17182.1.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 25 May 2003 16:31:27 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer dereference
 at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-05-25 at 19:26, kusdogan@boun.edu.tr wrote:
> > Thanks for the report. Please could you apply this patch and check what
> > it prints...
> > 
>  Here's the new output. 

Where exactly is the oops this time, and if it's not in add_mtd_device()
can you show the (decoded) backtrace too? (you need -mapcs-frame).

If it's still in add_mtd_device(), please show the entire disassembly of
that function. What compiler are you compiling with?

-- 
dwmw2
