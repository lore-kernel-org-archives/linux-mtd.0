Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3eFy-0000bC-VD
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 16:51:04 +0000
Message-Id: <6.0.1.1.0.20040317171534.01f84b38@192.168.2.1>
Date: Wed, 17 Mar 2004 17:51:00 +0100
To: David Woodhouse <dwmw2@infradead.org>
From: llandre <r&d@wawnet.biz>
In-Reply-To: <1079538886.16952.88.camel@hades.cambridge.redhat.com>
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
 <1079538886.16952.88.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: tglx@linutronix.de
cc: linux-mtd@lists.infradead.org
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
Subject: Re: Bug in nand_select_chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>On Wed, 2004-03-17 at 16:44 +0100, llandre wrote:
> > The old function, with chip==0, sets the nCE pin low:
>
> > The new function, with chip==0, sets the nCE pin high:
>
> > 1) Why did the code change this way?
>
>To handle multiple chips. More correctly, should should say
>"The new function, with chip == N, sets nCE on chip #N high."
>
>To deselect _all_ chips you use chip == -1.
>
>All callers of nand_select_chip() were changed at the same time
>though... this shouldn't cause a problem.

I fixed the driver as shown in the NAND Flash document:
- nCE pin low when hwcontrol is invoked with NAND_CTL_SETNCE
- nCE pin high when hwcontrol is invoked with NAND_CTL_CLRNCE

and now the driver works with the new MTD code.




Regards,

llandre 
