Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZQ7c-0004a9-KZ
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 13:36:27 +0000
Subject: Re: [PATCH] mtdoops: allow MTD selection by name
From: Richard Purdie <rpurdie@rpsys.net>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4999928F.1010304@nokia.com>
References: <4999928F.1010304@nokia.com>
Content-Type: text/plain
Date: Tue, 17 Feb 2009 13:28:13 +0000
Message-Id: <1234877293.5312.32.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Viktor Rosendahl <Viktor.Rosendahl@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2009-02-16 at 18:21 +0200, Adrian Hunter wrote:
> MTD's have both an index number and a name.  Formerly,
> the MTD selected for mtdoops was done only by index
> number.  With this patch, a name can be used instead.
> 
> For example, the kernel command line:
> 
> 	console=ttyMTD5
> 
> selects MTD 5 for mtdoops.  But now this is also possible:
> 
> 	console=ttyMTD,log
> 
> which selects the MTD named "log" for mtdoops.

> This has the advantage that partitions can be added or
> removed that would affect the MTD index number but not the
> name, without having to then change the kernel command line.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Acked-by: Richard Purdie <rpurdie@linux.intel.com>

-- 
Richard Purdie
Intel Open Source Technology Centre
