Received: from [2a01:4f8:101:2a4:0:bc28:b2d8:8] (helo=chuck.antcom.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4tPO-00082A-D9
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 12:54:43 +0000
Message-ID: <50377989.1050401@antcom.de>
Date: Fri, 24 Aug 2012 14:54:33 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ARM: LPC32XX SLC ECC Handling
References: <50222E55.5070204@embedded-brains.de>
 <1345808311.2848.286.camel@sauron.fi.intel.com>
In-Reply-To: <1345808311.2848.286.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On 24/08/12 13:38, Artem Bityutskiy wrote:
>> the LPC32XX SLC controller has a ECC feature that covers only the
>> main data area, but not the OOB data.  Is it the responsibility
>> of the user to protect its OOB data via an ECC?  The LPC32XX MLC
>> controller on the other hand covers the complete OOB data with
>> its ECC.  How can a user determine if it has to protect its OOB
>> data?
> 
> I guess it is good idea to CC the author of the drivers.

Thanks for CC'ing, would have missed it.

Yes, it's exactly as Sebastian described - only the MLC controller
covers OOB in ECC.

At this point, I need to give back the question to the MTD
maintainers: Is there an API how we can help users at this point? I
would be happy to implement it.

Thanks,

Roland
