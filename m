Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ckFe-0002nv-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 09:38:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002301c1b857$64b65120$126171d3@caesar> 
References: <002301c1b857$64b65120$126171d3@caesar> 
To: =?ks_c_5601-1987?B?sei/tcij?= <yhkim@openers.co.kr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problem with ftl_format 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 09:49:32 +0000
Message-ID: <21412.1014025772@redhat.com>
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

yhkim@openers.co.kr said:
>  I am building MTD/FTL driver on NAND Flash. When formating the mtd(/
> dev/mtd0) with ftl_format, format operation stops proceeding becaus of
> a bad block. why one bad block leads format operation to fail? Anybody
> could direct me how to handle this problem?
>  

Er, make ftl_format mark the block bad and continue?

--
dwmw2
