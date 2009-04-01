Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LouFS-0005a7-Bo
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 06:48:48 +0000
Subject: Re: [patch/rfc 2.6.29 2/2] MTD: support driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200903312342.24019.david-b@pacbell.net>
References: <200903260039.34013.david-b@pacbell.net>
	<200903312257.37434.david-b@pacbell.net>
	<1238566203.20906.31.camel@localhost.localdomain>
	<200903312342.24019.david-b@pacbell.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 09:48:08 +0300
Message-Id: <1238568488.20906.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-31 at 23:42 -0700, David Brownell wrote:
> On Tuesday 31 March 2009, Artem Bityutskiy wrote:
> > OK. MTD long needs sysfs, and I'm very happy with this
> > patches, even though they are not 100% complete. Good
> > start anyway.
> > 
> > Acked-by: Artem Bityutskiy <dedekind@infradead.org>
> 
> Thanks.  I'll expect someone to handle getting these
> merged through the MTD tree, then.

David Woodhouse maintains the MTD tree. He saw your patches,
not sure when he takes them.

> And I'll be rather surprised if no more attributes
> appear by the time this gets to mainline!  :)

If he merges them during this merge window, then this might
not be the case :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
