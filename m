Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGaGE-0000L9-Rv
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 23:44:00 +0000
Received: by mail-ua0-x241.google.com with SMTP id 20so10242759uak.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 15:43:36 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <1481557252-13656-4-git-send-email-clg@kaod.org>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Dec 2016 10:43:14 +1100
Message-ID: <CACPK8Xc938_y98WN=4HezPsosXQSb_LuJBkZa69FcdMuVfkVcw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: bindings for the Aspeed memory
 controllers
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

On Tue, Dec 13, 2016 at 2:40 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../devicetree/bindings/mtd/aspeed-smc.txt         | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt
