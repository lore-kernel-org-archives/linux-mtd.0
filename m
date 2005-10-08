Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOLrD-0002F2-8C
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2005 17:04:09 -0400
Message-ID: <43483464.6010704@mvista.com>
Date: Sat, 08 Oct 2005 14:04:36 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Holger Schurig <hs4233@mail.mn-solutions.de>
References: <200510051437.11856.hs4233@mail.mn-solutions.de>	<200510051701.54776.hs4233@mail.mn-solutions.de>	<4344038C.3040506@mvista.com>
	<200510071436.09694.hs4233@mail.mn-solutions.de>
In-Reply-To: <200510071436.09694.hs4233@mail.mn-solutions.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bug: Flash writing & suspending
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Holger Schurig wrote:
>>If that's accepted, I'll send a common PXA2xx platform driver for mtd that
>>adds the PM suspend/resume callbacks as discussed here recently.
> 
> Do you mean something like the sa1100-flash.c file?  Can't you re-use this 
> file?

Although we would need to do something about the sa1100-specific 
physical addresses and register access for bankwidth (this could 
probably go into the info passed from board files, there's a width field 
of the flash_info struct), and perhaps the pxa2xx cache invalidate code, 
but: yes, we're pretty close to a generic mapping driver for arches that 
declare a include/asm/mach/flash.h compatible with ARM's.  And there's 
probably a need for an alternative to the current definition of struct 
device's platform_data for these sorts of things, since many uses of 
platform_data really hold info represented in generic data structures, 
without a need for platform-specific definition or interpretation, so it 
could be on all platforms.  I might try to run that by folks sometime soon.


-- 
Todd
