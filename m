Received: from [211.47.47.10] (helo=www.openers.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ckni-0002rZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 10:13:38 +0000
Message-ID: <03d101c1b866$9125c0b0$126171d3@caesar>
From: =?ks_c_5601-1987?B?sei/tcij?= <yhkim@openers.co.kr>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: problem with ftl_format 
Date: Mon, 18 Feb 2002 19:25:20 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

No, it just print error message and return

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "°æe¢Ø•ÏE°Ã" <yhkim@openers.co.kr>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, February 18, 2002 6:49 PM
Subject: Re: problem with ftl_format


>
> yhkim@openers.co.kr said:
> >  I am building MTD/FTL driver on NAND Flash. When formating the mtd(/
> > dev/mtd0) with ftl_format, format operation stops proceeding becaus of
> > a bad block. why one bad block leads format operation to fail? Anybody
> > could direct me how to handle this problem?
> >
>
> Er, make ftl_format mark the block bad and continue?
>
> --
> dwmw2
