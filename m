Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ELupa-0004MK-58
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2005 23:48:15 -0400
Message-ID: <433F586B.2000102@mvista.com>
Date: Sat, 01 Oct 2005 20:47:55 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Kathy Richards <kath_rich64@yahoo.com>
References: <20051001053902.90833.qmail@web33008.mail.mud.yahoo.com>
In-Reply-To: <20051001053902.90833.qmail@web33008.mail.mud.yahoo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Spansion MirrorBit support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kathy Richards wrote:
> Hi list,
> 
> I have to use S29GL032M flash which is Spansion
> MirrorBit, CFI compatible. I searched the archives and
> it seems like it should work "out of the box". I'm
> using kernel version 2.6.13. 
> 
> 1. I'm wondering if anyone has actually used this (or
> a similar spansion mirrorbit chip) and knows for sure
> that it works...?
> 
> 2. Is the MirrorBit tech transparent to mtd/jffs2 (as
> long as the chip is CFI compatible?)

Have used S29W models, check the datasheet for your model and see if the 
CFI query address is 0x555, if so see:

http://lists.infradead.org/pipermail/linux-mtd/2005-September/013641.html

Haven't checked if there are features of the flash that mtd/jffs2 aren't 
taking advantage of, but most chips do work.

-- 
Todd
