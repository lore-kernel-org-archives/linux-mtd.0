Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EVdD-0003kM-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 12:06:03 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EVdB-0003kG-00
	for mtd@infradead.org; Fri, 05 Jan 2001 12:06:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <978636488.3a54cec86af09@webmail2.asu.edu> 
References: <978636488.3a54cec86af09@webmail2.asu.edu> 
To: Russ.Dill@asu.edu
Cc: mtd@infradead.org
Subject: Re: Supported flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Jan 2001 12:05:46 +0000
Message-ID: <2842.978696346@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Russ.Dill@asu.edu said:
>  Besides footprints, pinouts, etc, my other concern is software. The
> logical combination would seem to be blob/mtd. What flash products are
> known or probable to be compatible with this combination, what should
> I look for to attempt to assertain compatibilty? Does blob/mtd work
> transparently with a 16bit or 32bit ROM bus? 

The MTD code ought to work with any CFI-compliant flash chip from Intel or 
AMD, and with a few others too. In most combinations of bus size / 
interleave.

I don't know about blob, but RedBoot should support most of the flash 
setups you're likely to encounter, too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
