Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeXWc-0006qd-7g
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 19:12:42 +0000
Received: by wwf22 with SMTP id 22so169835wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jul 2011 12:12:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1308717655.18119.19.camel@sauron> <itsbm4$d29$1@dough.gmane.org>
	<CAN8TOE_DOEUoqOnoX4D3KQz07C43ktJzSL+xuJgvCkDqrWAoPw@mail.gmail.com>
Date: Wed, 6 Jul 2011 12:12:39 -0700
Message-ID: <CAN8TOE_ZTCeP2mObV0MtsdP4NQvtME-n4Q_BWTi9sR6uB3xVNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 6, 2011 at 11:51 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> static inline struct device *mtd_to_dev(struct mtd_info *mtd)
> {
> =A0 =A0 =A0 =A0return mtd ? mtd->dev.parent : NULL;
> }

Second thought on this function; we may not even need to worry about
the "mtd =3D=3D NULL" case. But we might want to handle the case that
mtd->dev actually *is* registered properly:

static inline struct device *mtd_to_dev(struct mtd_info *mtd)
{
        if (device_is_registered(&mtd->dev))
                return &mtd->dev;
        return mtd->dev.parent;
}

Brian
