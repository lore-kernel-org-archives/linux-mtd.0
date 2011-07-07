Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QerxT-0000DL-MB
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 17:01:48 +0000
Received: by wwf22 with SMTP id 22so810565wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 10:01:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1310022117.3149.123.camel@sauron>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
	<1307635412.7374.128.camel@localhost>
	<BANLkTimh12AhqfE+Yx3Yi_m=NyUb34JoXA@mail.gmail.com>
	<1310022117.3149.123.camel@sauron>
Date: Thu, 7 Jul 2011 10:01:45 -0700
Message-ID: <CAN8TOE_-zE5Z45R94np0=1J6B8RfXxVm1v0_3h7z6R+Uosxx0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 7, 2011 at 12:01 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Mon, 2011-06-13 at 11:24 -0700, Brian Norris wrote:
>> =A0(null): ONFI flash detected
>
> You mean that
>
> dev_info(&mtd->dev, "ONFI flash detected");
>
> produces this?

Yes, sorry for not being specific.
