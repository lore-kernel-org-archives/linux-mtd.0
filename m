Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TKqy-0003fX-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 09:37:32 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TKqx-0003fR-00
	for mtd@infradead.org; Thu, 15 Feb 2001 09:37:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7118259C3044D311942700508B2CA5BB61AB17@balance.coactive.com> 
References: <7118259C3044D311942700508B2CA5BB61AB17@balance.coactive.com> 
To: David Byron <dbyron@coactive.com>
Cc: mtd@infradead.org
Subject: Re: AMD Flash flaming 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Feb 2001 09:34:08 +0000
Message-ID: <14036.982229648@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dbyron@coactive.com said:
> I just subscribed to the list a few days ago and caught some
> discussion on annoying characteristics of some AMD flash devices.
> Turns out we're in the middle of selecting a flash device for a new
> platform and one of the choices being considered is the AMD
> Am29LV033C.  Sorry if this is covered elsewhere, but is this one of
> the annoying/busted chips? 

They're not busted, just annoying. I happen to think the designers were on
crack, but the chips are still usable, even though their CFI tables are
crap. Even if we have to hard-code a table of chip ID vs. erase block
layout, they're usable - unless they've really gone mad and shipped chips
with the _same_ JEDEC ID but different layouts.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
