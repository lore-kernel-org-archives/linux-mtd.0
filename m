Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18I9ug-0004pi-00
	for <linux-mtd@lists.infradead.org>; Sat, 30 Nov 2002 15:52:14 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <43CB1396676FD4119F03001083FD299401A1C6CB@neptune.kirkland.local> 
References: <43CB1396676FD4119F03001083FD299401A1C6CB@neptune.kirkland.local> 
To: Paul Nash <paulnash@wildseed.com>
Cc: =?iso-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>,
    linux-mtd@lists.infradead.org
Subject: Re: Restart problems after writing to mtdblock? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 30 Nov 2002 16:22:39 +0000
Message-ID: <12908.1038673359@passion.cambridge.redhat.com>
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

paulnash@wildseed.com said:
>  Power fail is not a concern -- this only occurs in the case of a
> software reboot of the chip without power loss.  An external reset is
> not an issue. Flash chips don't store state as to their last read mode
> across power failure anyway. 

I wouldn't swear to that. You could feasibly have a power outage long 
enough to reset most of the board, but the flash chips don't draw much 
power and could perhaps retain their state.

Unlikely perhaps, but I wouldn't declare it impossible.


--
dwmw2
