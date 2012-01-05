Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=TX2EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rickl-00055i-Dp
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 02:08:27 +0000
Message-ID: <4F050635.1020103@freescale.com>
Date: Thu, 5 Jan 2012 10:08:53 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
References: <201201040148.32847.marek.vasut@gmail.com>
 <4F03EA83.9030503@freescale.com> <201201042233.15645.marek.vasut@gmail.com>
In-Reply-To: <201201042233.15645.marek.vasut@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
>> I will be happy if the driver works only by setting the
>> >  NAND_NO_SUBPAGE_WRITE, without setting the ecc.size.
> So you intentionally set the ecc.size to 1 to work around the issue?
>
yes.
I read the code, and it seemed setting the ecc.size to 1 is the right 
solution.

Best Regards
Huang Shijie
