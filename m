Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mwbf-0002BD-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 12:51:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <PCEBLNKIDOKLBPDJECFEEEBBDHAA.sbardsley@rlwinc.com> 
References: <PCEBLNKIDOKLBPDJECFEEEBBDHAA.sbardsley@rlwinc.com> 
To: "Stephen Bardsley" <sbardsley@rlwinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: bad block recovery 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Mar 2002 13:02:43 +0000
Message-ID: <29597.1016456563@redhat.com>
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

sbardsley@rlwinc.com said:
>  My understanding is that the chip is now "unreliable", which I can
> live with for now.  Does unreliable mean I can still use the chip if I
> can somehow format it?

Yes. Blocks can go bad during normal operation, and we have to be able to 
deal with that case _anyway_. My nftl_format program can be made to do some 
primitive tests on each erase block, and mark the completely broken ones as 
such before formatting. But (for the benefit of the peanut gallery) you 
should _only_ use nftl_format if you have already lost your bad block list.

--
dwmw2
