Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Idzr-00031c-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 00:27:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020613235324.F4388@schwebel.de> 
References: <20020613235324.F4388@schwebel.de> 
To: Robert Schwebel <robert@schwebel.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Plans for 2.4.19 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 00:27:15 +0100
Message-ID: <32738.1024010835@redhat.com>
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

robert@schwebel.de said:
> I remember having read something about the plans for the 2.4.19
> upgrade, but couldn't find the thread in my archive any more. As the
> DIL/Net-PC code currently being in 2.4.19-pre10 is currently broken
> I'm wondering if it would be possible to get the stuff from CVS into
> _this_ version? Marcelo releases very slowly at the moment, so not
> doing it does probably mean to wait another half a year for a working
> kernel... 

> David, what's your current plan? 

I fed Marcelo most of the latest code for 2.4.19-pre. All that I remembered
was outstanding was the updated flash driver probe stuff and 64-bit 
support. The plan was to do that in 2.4.20-pre1. What's wrong with the DIL/
Net-PC code and can it be fixed without having to update all the CFI code?

--
dwmw2
