Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeYGB-0007Wr-Ny
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 19:59:48 +0000
Received: by wyf23 with SMTP id 23so247346wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 12:59:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALT56yN_tY_YJQbC4POsaOc639dN_6yFo_90CGWR617kUjYnfQ@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
	<CAN8TOE_ZTCeP2mObV0MtsdP4NQvtME-n4Q_BWTi9sR6uB3xVNQ@mail.gmail.com>
	<CALT56yN_tY_YJQbC4POsaOc639dN_6yFo_90CGWR617kUjYnfQ@mail.gmail.com>
Date: Wed, 6 Jul 2011 12:59:43 -0700
Message-ID: <CAN8TOE_TYLstfwTVPsPx8tT13tb0F9beosW+LiniwYNfUEY8Tw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
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

On Wed, Jul 6, 2011 at 12:47 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> And what if mtd->dev.parent is NULL?

Then we're out of luck and simply return NULL.

NULL shouldn't cause an error for debug messages, and if mtd_to_dev is
used for something more serious, then you have a problem you must fix
if mtd->dev.parent is NULL.
