Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M1w9d-0006Mj-LW
	for linux-mtd@lists.infradead.org; Thu, 07 May 2009 05:28:28 +0000
Subject: Re: Load UBI faster
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <1241673722.27549.14.camel@localhost.localdomain>
References: <72795ccb0905060026q7dcb45c0u15c35943374fcc78@mail.gmail.com>
	<1241673722.27549.14.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 07 May 2009 08:28:12 +0300
Message-Id: <1241674092.27549.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-07 at 08:22 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-05-06 at 09:26 +0200, simon polette wrote:
> > I'm trying to improve boot time on a at91sam9261ek board. I boot on
> > nand flash with ubifs. It take about 400ms to load ubi and ubifs.
> > Do you know if fastboot technology, which consist in loading drivers
> > asynchronously, is conceivable with UBI ?
> > Thanks for your help.
> 
> Fastbood is applicable in the situation when initialization
> is mostly about sleeping and waiting for hw. In case of UBI,
> it reads from flash and calculates CRC. The reading from NAND
> is usuall synchronous, so this process takes 100% of your CPU.
> 
> One way to optimize this a little would be to use on-flash
> BBT. Usually the nand core scans full NAND to find bad blocks.
> With on-flash BBT this could be avoided. But probably this
> would not give you much.

You could also play with CRC. ATM we use CRC32 for UBI headers.
This is rather expensive if you CPU is slow. I'd try to hack
UBI and see what changes if it does not calculate it. If it
helps, you could try to consider CRC16 or adler32 instead of
CRC32.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
