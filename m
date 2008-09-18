Received: from mail.renesas.com ([202.234.163.13] helo=mail01.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KgIaP-0005B4-7s
	for linux-mtd@lists.infradead.org; Thu, 18 Sep 2008 12:26:17 +0000
Date: Thu, 18 Sep 2008 21:25:57 +0900
From: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [PATCH] mtd: sh_flctl: add support for Renesas SuperH FLCTL
In-reply-to: <20080917145731.GA31104@linux-sh.org>
Sender: shimoda.yoshihiro@renesas.com
To: Paul Mundt <lethal@linux-sh.org>
Message-id: <48D248D5.60106@renesas.com>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
References: <48C62D1E.7020906@renesas.com>
	<20080917145731.GA31104@linux-sh.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Mundt wrote:
> On Tue, Sep 09, 2008 at 05:00:30PM +0900, Yoshihiro Shimoda wrote:
>> Several Renesas SuperH CPU has FLCTL. The FLCTL support NAND Flash.
>> This driver support SH7723.
>>
>> Signed-off-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
> 
>> +	flctl->reg = ioremap(res->start, res->end - res->start);
>> +	if (flctl->reg == NULL) {
>> +		printk(KERN_ERR "%s: ioremap error.\n", __func__);
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
> You have an off-by-1 here, this wants to be res->end - res->start + 1.
> 
> Other than that, it looks ok to me at first glance.
> 
> Acked-by: Paul Mundt <lethal@linux-sh.org>
> 

Thank you for your comment. I'll fix up this code.

thanks,
Yoshihiro Shimoda
