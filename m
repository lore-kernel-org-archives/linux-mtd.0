Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pmvK-00028y-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 09:02:50 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pmvJ-00028s-00
	for mtd@infradead.org; Wed, 18 Apr 2001 09:02:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3ADCDA29.5E167060@echostar.com> 
References: <3ADCDA29.5E167060@echostar.com>  <3ADC7273.DB541A9C@echostar.com> <10503.987545517@redhat.com> 
To: ian.nelson@echostar.com
Cc: "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: A pair of stupid questions, I hope 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Apr 2001 09:02:42 +0100
Message-ID: <13711.987580962@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


ian.nelson@echostar.com said:
>  I'll ask the guys who need it.  I suspect the proposal would be an
> ISLOCKED ioctl that takes a region as an argument and returns a 0 or
> 1.   I'm a flash novice though, is this something that should go in to
> one of those region structures? 

I was thinking of the internal API - what method do we add to the struct 
mtd_info, and how generic can we make it? Aren't there other similar 
per-block data which we may want to query on some chips?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
