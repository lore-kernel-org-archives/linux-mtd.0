Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14MrkY-0007l3-00
	for mtd-list@infradead.org; Sun, 28 Jan 2001 13:20:10 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14MrkX-0007kx-00
	for mtd@infradead.org; Sun, 28 Jan 2001 13:20:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBLKIBMLGPAFMHEJICEEANCFAA.michalk@awpi.com> 
References: <NEBBLKIBMLGPAFMHEJICEEANCFAA.michalk@awpi.com> 
To: " Brian Michalk" <michalk@awpi.com>
Cc: mtd@infradead.org
Subject: Re: fdisk problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 28 Jan 2001 13:19:44 +0000
Message-ID: <1401.980687984@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


michalk@awpi.com said:
>  I recall that at some time in the past, we need needed to write
> either zeroes, or FFs to the flash before using it.  Is this still
> required? Is there a different .exb file I should be using? 

Nope. It looks like there's something 'different' about the ECC on the 
larger units. I'll have to poke at it and find out what.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
