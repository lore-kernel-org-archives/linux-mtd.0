Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gjiR-00022E-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 09:52:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0203010137150.852-100000@ba.devicemonsters.com> 
References: <Pine.LNX.4.21.0203010137150.852-100000@ba.devicemonsters.com> 
To: "Brian P. Austin" <baustin@codemonsters.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Mar 2002 10:03:23 +0000
Message-ID: <9647.1014977003@redhat.com>
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

baustin@codemonsters.net said:

> e==1 to find free EUN to accommodate write to VUC 7182 
> Argh! No free blocks found! LastFreeEUN = 7679, FirstEUN = 0 
> Cannot make free space.
> NFTL_writeblock(): Cannot find block to write to 
> NFTL write request failed
> end_request: I/O error, dev 5d:01 (unknown), sector 229822 

Eep. I thought all the cases where that could happen had been fixed. Can 
you enable all the debugging and log it all (serial console useful)? I'll 
see if I can sort it out. Check you're using the latest NFTL code from CVS, 
but I think Marcelo has that anyway.

This code is starting to show its age - I originally threw it together to
check I understood the format, and haven't ever got round to doing the
rewrite that it needs. I've been badgering our sales people ever since I got
here to find me a customer so I can spent some real time on it, but so far
all attempts have failed. 

How keen are you to switch? It shouldn't take that much work, and I'll 
happily help you with it - I just haven't so far been able to find the time 
to do it myself.

--
dwmw2
