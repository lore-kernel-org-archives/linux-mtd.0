Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGED9-0003vS-2N
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 00:11:20 +0000
Received: by mail-vk0-x243.google.com with SMTP id x186so3414889vkd.2
 for <linux-mtd@lists.infradead.org>; Sun, 11 Dec 2016 16:10:58 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481302167-28044-3-git-send-email-clg@kaod.org>
References: <1481302167-28044-1-git-send-email-clg@kaod.org>
 <1481302167-28044-3-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Dec 2016 11:10:37 +1100
Message-ID: <CACPK8Xf1RZa8ZvSWBJHvxGRLqkYaEJJ=kejn=1oXc0dSQVewwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: aspeed: add memory controllers for the Aspeed
 AST2400 SoC
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
> This driver adds mtd support for the Aspeed AST2400 SoC static memory
> controllers:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Good work. It was worth spending the time splitting out the different
controllers I think.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/Kconfig      |  2 +-
>  drivers/mtd/spi-nor/aspeed-smc.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
