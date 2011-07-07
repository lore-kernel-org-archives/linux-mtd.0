Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qeifp-0005sw-0X
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 07:06:58 +0000
Received: by pzk28 with SMTP id 28so703000pzk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 00:06:52 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 07 Jul 2011 10:01:53 +0300
In-Reply-To: <BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310022117.3149.123.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
> 
> I've been testing some of the "dev_*" printing, and it seems as if our
> mtd_info structs never have fully initialized "device" fields (i.e.,
> mtd->dev.driver, mtd->dev.bus, mtd->dev.class, mtd->dev.init_name,
> etc. are never filled in with anything meaningful). That means that
> our dev_* messages do not have anything to work from and simply print
> " (null): " references before our strings instead of device
> driver/name information, for example:
> 
>  (null): ONFI flash detected 

You mean that

dev_info(&mtd->dev, "ONFI flash detected");

produces this?

-- 
Best Regards,
Artem Bityutskiy
