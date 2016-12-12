Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGE81-0002Du-3K
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 00:06:01 +0000
Received: by mail-ua0-x244.google.com with SMTP id 20so7017207uak.0
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 16:05:40 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481302167-28044-2-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-2-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 11:05:19 +1100
Message-ID: <CACPK8XdUSExe91JO1n8RcpSCKTnPZAyErFFerx4kVuaV_X9Cmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 10, 2016 at 3:49 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> This driver adds mtd support for the Aspeed AST2500 SoC static memory
> controllers :


> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

I had a read and it looks good. Once you have addressed Marek's
review, please add:

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/Kconfig      |  10 +
>  drivers/mtd/spi-nor/Makefile     |   1 +
>  drivers/mtd/spi-nor/aspeed-smc.c | 735 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 746 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/aspeed-smc.c
>

> +
> +MODULE_DESCRIPTION("ASPEED Static Memory Controller Driver");
> +MODULE_AUTHOR("Milton Miller");

You can stick your name here instead, or drop the define.

> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>
