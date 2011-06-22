Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJWk-0003by-Gf
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:15:15 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QZJWf-00059o-2b
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 11:15:09 +0200
Received: from 91.213.169.4 ([91.213.169.4])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2011 11:15:09 +0200
Received: from dbaryshkov by 91.213.169.4 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2011 11:15:09 +0200
To: linux-mtd@lists.infradead.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
Date: Wed, 22 Jun 2011 09:12:37 +0000 (UTC)
Message-ID: <itsbm4$d29$1@dough.gmane.org>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

> On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
>> I'm a little new to the Linux device model, so I'm not sure if it's
>> safe and sensible to add lines to a driver's nand_probe function,
>> like, for plat_nand.c:
>> data->mtd.dev.driver = pdev->dev.driver;

IIUC, we should not set driver, but it might be better to consult with
more experienced DM hackers (like Greg Kroah-Hartman).

>> data->mtd.dev.init_name = dev_name(&pdev->dev);
>
> I think so, I believe struct device was added to mtd by some non-MTD guy
> to just make it complaint with one of interface changes which required
> struct device. So please, go ahead and improve that a bit.
-- 
With best wishes
Dmitry
