Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oVVP-0002SY-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 20:47:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110022139240.18002-100000@chaingun.noernet.de> 
References: <Pine.LNX.4.33.0110022139240.18002-100000@chaingun.noernet.de> 
To: dennis noermann <dennis.noermann@noernet.de>
Cc: Larry Doolittle <ldoolitt@recycle.lbl.gov>,
    linux-mtd@lists.infradead.org
Subject: Re: JFFS2_RESERVED_BLOCKS_* 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 20:56:03 +0100
Message-ID: <5927.1002052563@redhat.com>
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

dennis.noermann@noernet.de said:
> for an 640kb partition on 2*intelF320 (8MB) so 128 kb are wastet , it
> is working fine , till i am copying more than the 512kb free space in
> the partition , then deleting doesnt work

> i think there is only 1 littel mistake in my config , but i was to
> lazy to figger out the problem JFFS2_RESERVED_BLOCKS_DELETION has to
> be set to 0 i think , i will try it next time i have time :) 

That sounds like a reasonable assessment, and it's good news that it seems 
to work. However, I believe there are one or two corner cases in the garbage 
collection code, which should almost never actually get triggered, in which 
it's not quite sufficient. So I'm unhappy about reducing it in the general 
case until I can prove that it's safe. 

--
dwmw2
