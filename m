Received: from mail.avrupayazilim.com ([88.247.191.72] helo=avrupayazilim.com)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ke28W-0001t3-19
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 06:28:08 +0000
Message-ID: <48CA0C11.6080402@multitekarge.com>
Date: Fri, 12 Sep 2008 09:28:33 +0300
From: Ensar Gul <ensar.gul@multitekarge.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
References: <mailman.11.1221062402.21406.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.11.1221062402.21406.linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: ensar.gul@multitekarge.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> AFAIK, jffs2 doesn't handle correctly bit flip on read : it won't try to 
> copy the data on another block while the data can still be recovered 
> by ecc.
>
> I believe it could be a big issue for commercial product where no 
> corruption should happen.
>
>
> Matthieu

Is there a solution to the problem stated above yet?

By the way, I also used JFFS2 on NAND flash as root filesystem in a 
telecom product. but the root filesystem infrequently becomes corrupt 
without any apparent reason. I`m considering to redesign the hardware 
and use an alternative device instead of NAND flash.

any comments on this issue will be appreciated.

rgds

Ensar
