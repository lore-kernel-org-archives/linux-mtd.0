Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fOoc-0003X5-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 17:21:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202251817100.12881-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202251817100.12881-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: Adam Wozniak <awozniak@comdev.cc>, linux-mtd@lists.infradead.org,
    Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Feb 2002 17:32:46 +0000
Message-ID: <26609.1014658366@redhat.com>
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

rob@sysgo.de said:
>  What mechanism is there to avoid writes during erase suspend ? I have
> seen the problem in situations where the JFFS2 GC thread was erasing
> while another process (tar in my case) was writing to a *different
> partition* in the same chip. (Maybe that is a hint ?) Introducing the
> set_vpp counter reliably solved this.

All the partition code does is add an offset and call into the original 
underlying flash driver. So it just looks like two concurrent calls to the 
one driver, and the state machine ought to deal with that correctly.

--
dwmw2
