Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aIS1-0000iA-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 14:28:33 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14aIS0-0000i4-00
	for mtd@infradead.org; Tue, 06 Mar 2001 14:28:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01030615265401.02401@rob> 
References: <01030615265401.02401@rob>  <30724FF712DFD2119E6200104B2448920119745E@mail1> 
To: rob@sysgo.de
Cc: Vipin Malik <Vipin.Malik@daniel.com>, mtd@infradead.org
Subject: Re: Using mtdblock as root device 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Mar 2001 14:28:08 +0000
Message-ID: <16655.983888888@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


rob@sysgo.de said:
>  I'd say since the kernel does support a "root=..." option it might as
> well support it for all possible devices rather than just a selection
> of them.

I agree. The patch has been submitted many times. I'll resubmit it next 
time I bother - actually it may already be in -ac patches.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
