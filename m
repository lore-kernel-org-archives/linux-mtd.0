Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LovoR-0000ud-MT
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 08:28:50 +0000
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0904011023560.9213@lnxricardw.se.axis.com>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<Pine.LNX.4.64.0904010920570.9213@lnxricardw.se.axis.com>
	<200904010105.33674.david-b@pacbell.net>
	<Pine.LNX.4.64.0904011023560.9213@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2009 11:28:12 +0300
Message-Id: <1238574492.20906.71.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-01 at 10:25 +0200, Ricard Wanderlof wrote:
> On Wed, 1 Apr 2009, David Brownell wrote:
> 
> > Erasing an MTD partition may require an ioctl forever.  :)
> 
> Well, I can imagine that one actually being accomplished with a simple 
> write to a sysfs file ... but we might not want to make it that simple.

Of course we are talking only about _informational_ interfaces, when
MTD provides various information - size, name, type, etc.
Of course erasing, marking blocks bad, etc should be implemented
as ioctl.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
