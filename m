Received: from lakermmtai18.cox.net ([68.230.240.41])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DHCBY-0007ya-Mt
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 21:47:01 -0500
Message-ID: <424CAE31.8040302@ieee.org>
Date: Thu, 31 Mar 2005 21:13:05 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>
	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>
	<424CA4EA.8090904@infocell-its.com>
In-Reply-To: <424CA4EA.8090904@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zeri Virgo wrote:
>  > - How big is your firmware area?  (I'm assuming you resized it using
>  > the DOS-based tools)
> Well, I used dformat on a different chip as suggested, but that was with
> the unpatched kernel, so the chip probing failed (but didn't crash).
> I'm now using a fresh one - I didn't think I should _have_ to resize the 
> firmware area first, should I? I'll try the patched kernel with a 
> resized-firmware-area chip tomorrow....ZZZ

No, you're quite right.  In fact, it's very useful for me to know that 
the code crashes even when you don't have a resized firmware area. 
Don't even bother trying it with a resized firmware tomorrow :)

>  > - Did the diskonchip driver work for you without crashing before my
>  > latest changes?
> Yes, I've been using 2.6.11.5 with the diskonchip driver compiled in -
> see first dmesg section below...

So is it correct to say that you've just switched from the diskonchip 
driver which is distributed as part of 2.6.11.5, to the diskonchip 
driver from the MTD CVS repository?

If so, then any of the changes between the MTD version in 2.6.11.5 and 
the current CVS are potentially the problem, not just my latest change 
to diskonchip.c

The version of diskonchip.c in 2.6.11.5 is 1.45.  I don't see anything 
in the changes between then and now (1.50) that should cause the 
behavior you're seeing, which means either the problem is in a different 
file or I'm just not seeing it :)

I'll stare at it some more tomorrow.  Anyone else (Thomas?) have any 
ideas where to look?

> Sorry I haven't offered any real help on this!
> 
> - Zeri

On the contrary, you're much better at providing the right information 
than most people.

	-Dan
