Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiIDw-0004TA-7l
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 15:36:56 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Thomas W. Nelson" <twn@dot4.com>
In-Reply-To: <40EC43ED.6090401@dot4.com>
References: <40EB0D28.60309@dot4.com>
	<1089196350.5577.22.camel@localhost.localdomain>
	<40EC43ED.6090401@dot4.com>
Content-Type: text/plain
Message-Id: <1089229011.4840.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 07 Jul 2004 20:36:52 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD support on Motorola Hawk ASIC-based boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-07 at 14:41 -0400, Thomas W. Nelson wrote:
> Just as a sanity check (since I have so little left :-), will these 
> modifications also correctly deal with the 32-bit only write limitation 
> during probes?  Getting the chips into query mode appears to be the real 
> challenge here; I haven't been able to perform the correct incantation 
> to get them to respond in any way, CFI or JEDEC. 

You ought to be able to fake 64-bit buswidth for the case you described.
Play with it in GDB for a while, poking commands at various addresses
and looking for the idents.

> I'd also like to inject some personal observations about the more 
> complex flash geometries that are appearing.  On higher-end boards, such 
> as those from Dy4, Pentek, etc., these multibank interleaved 
> configurations are becoming very common as their customers want high 
> performance flash access for their XIP or flash filesystem-based 
> application environments. 

Whereas others just use Intel chips configured for burst reads... 

I suspect that the best way forward might be to turn the cfi_word
typedef into a structure with an array of unsigned longs. In the common
case there'll be only one of them, but for pathological cases there can
be many.

-- 
dwmw2
