Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE1gb-0006iB-Df
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 08:53:25 +0100
Message-ID: <407E3E9B.70903@auriga.ru>
Date: Thu, 15 Apr 2004 11:49:47 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <407D59A6.7030102@auriga.ru>
	<200404141744.15766.tglx@linutronix.de>
In-Reply-To: <200404141744.15766.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: nand driver bug?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>>    The driver happens to fall in BUG in nand_select_chip when writing
>>the last page of a device. It's trying to select_chip in nand_write_ecc
>>even in case there's nothing left to write.
>>    
>>
>
>Yep, you're right. I noticed this already and fixed it, but did not yet commit 
>it, as I changed a lot of other things.
>Should be fixed until tomorrow morning
>
>  
>
Any changes should be done in boards' drivers? Fresh CVS version oopses 
in nand_scan.

wbr, Dmitry
