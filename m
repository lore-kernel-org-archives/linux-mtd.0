Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhZjF-0007RB-Pl
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 12:14:19 +0000
Received: by mail-qt0-x231.google.com with SMTP id m13-v6so344418qth.1
 for <linux-mtd@lists.infradead.org>; Mon, 23 Jul 2018 05:14:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <20180622121417.6762-4-clg@kaod.org>
References: <20180622121417.6762-1-clg@kaod.org>
 <20180622121417.6762-4-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 23 Jul 2018 21:43:46 +0930
Message-ID: <CACPK8XdLb54FfPjVpeUkjDja_7O9EizJJ8BRJLGxdbMMckjWLg@mail.gmail.com>
Subject: Re: [PATCH 3/4] mtd: spi-nor: aspeed: retrieve the ABH clock frequency
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 June 2018 at 21:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> We will need the AHB frequency to set the SPI clock frequency to
> perform the SPI calibration sequence and optimize the controller
> settings for the fast reads.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
