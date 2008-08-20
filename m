Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVwXb-0006ZV-Hy
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 22:52:35 +0000
Received: by wf-out-1314.google.com with SMTP id 28so604517wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Aug 2008 15:52:34 -0700 (PDT)
Message-ID: <9c9fda240808201552w1d4025e7g9e27d9740396b9b2@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:52:34 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: OneNAND Cache Read Operation
In-Reply-To: <48ABC998.8040303@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48ABC998.8040303@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I finally got around to trying OneNAND Cache Read Operation.
>
> I got the same results as you.  Just a 1 - 2 % increase in speed
> on OMAP3.  It seems that the OMAP memory controller (GPMC) is not
> capable of transferring the data from bufferRAM fast enough to
> achieve the maximum OneNAND read speed.
>

Yes, it's right.
For more. OneNAND has Block synchronous read. It reads whole block at
a time. but there's no performance gain compare to read-while-load at
least in OMAP.

Thank you,
Kyungmin Park
