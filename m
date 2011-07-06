Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeY4n-0007MI-Hq
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 19:48:02 +0000
Received: by vws8 with SMTP id 8so298125vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 12:47:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_ZTCeP2mObV0MtsdP4NQvtME-n4Q_BWTi9sR6uB3xVNQ@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
	<CAN8TOE_ZTCeP2mObV0MtsdP4NQvtME-n4Q_BWTi9sR6uB3xVNQ@mail.gmail.com>
Date: Wed, 6 Jul 2011 23:47:59 +0400
Message-ID: <CALT56yN_tY_YJQbC4POsaOc639dN_6yFo_90CGWR617kUjYnfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Igor Grinberg <grinberg@compulab.co.il>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/6/11, Brian Norris <computersforpeace@gmail.com> wrote:
> On Wed, Jul 6, 2011 at 11:51 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> static inline struct device *mtd_to_dev(struct mtd_info *mtd)
>> {
>>        return mtd ? mtd->dev.parent : NULL;
>> }
>
> Second thought on this function; we may not even need to worry about
> the "mtd == NULL" case. But we might want to handle the case that
> mtd->dev actually *is* registered properly:
>
> static inline struct device *mtd_to_dev(struct mtd_info *mtd)
> {
>         if (device_is_registered(&mtd->dev))
>                 return &mtd->dev;
>         return mtd->dev.parent;

And what if mtd->dev.parent is NULL?


-- 
With best wishes
Dmitry
