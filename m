Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B4FFo-0002MI-Mf
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 08:21:21 +0000
Message-Id: <6.0.1.1.0.20040319091531.01f95270@192.168.2.1>
Date: Fri, 19 Mar 2004 09:21:17 +0100
To: David Updegraff <dave@cray.com>
From: llandre <r&d@wawnet.biz>
In-Reply-To: <4059EB24.7020603@cray.com>
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
 <200403181411.25596.tglx@linutronix.de>
 <6.0.1.1.0.20040318154520.01ec5658@192.168.2.1>
 <4059EB24.7020603@cray.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>Does anyone know how 'industry-standard' the format of the 4th ID byte in 
>these large NAND chips from Samsung is?  Y'know, the one that tells you 
>pagesize, buswidth, etc.  I'd sure be sweet to be able to reliably use them.

Hi David,

I'm not sure I understood exactly your question anyway the 4th ID byte is 
usually described in the
technical datasheet. For example, for the K9F1G08U0M, it is detailed on 
pages 28 and 29.

PS: which chip are you going to work with?



Regards,

llandre 
