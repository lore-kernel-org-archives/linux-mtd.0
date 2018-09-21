Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3BU7-0002zF-Ov
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 02:48:01 +0000
Received: by mail-qt1-x843.google.com with SMTP id t39-v6so409772qtc.8
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2018 19:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180622121417.6762-1-clg@kaod.org>
 <20180622121417.6762-2-clg@kaod.org>
 <CACPK8Xf-XfxMVMewC5T6u1XzDX3idqk+FeGRLMC+xrKDqtWggg@mail.gmail.com>
In-Reply-To: <CACPK8Xf-XfxMVMewC5T6u1XzDX3idqk+FeGRLMC+xrKDqtWggg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Sep 2018 12:09:57 +0930
Message-ID: <CACPK8XePSehmuYTtJFYuNqUz_CQ4cQ6s4gdZ2rKNKUpO46yZKQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: spi-nor: aspeed: use command mode for reads
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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

Hello Mark,

On Mon, 23 Jul 2018 at 21:42, Joel Stanley <joel@jms.id.au> wrote:
>
> On 22 June 2018 at 21:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> > When reading flash contents, try to use the "command mode" if the AHB
> > window configured for the flash module is big enough. Else, just fall
> > back to the "user mode" to perform the read.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Are you waiting on anything from Cedric or myself for this series. If
not, can we please get them queued for 4.20?

Cheers,

Joel
