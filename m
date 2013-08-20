Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBbPg-0007RX-Bs
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 02:11:17 +0000
Message-ID: <5212D05F.8070907@freescale.com>
Date: Tue, 20 Aug 2013 10:11:43 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>	<1376619009-8622-7-git-send-email-b32955@freescale.com>	<1376660759.2089.358.camel@sauron.fi.intel.com>	<20130817032644.GA27332@gmail.com>	<20130817181447.GC5034@norris.computersforpeace.net>	<20130818142911.GA3615@gmail.com>
 <CAN8TOE_u1OVWJw7zzzNGNQAs60RBBL7AajZn=bwTW=eB-y_b0w@mail.gmail.com>
In-Reply-To: <CAN8TOE_u1OVWJw7zzzNGNQAs60RBBL7AajZn=bwTW=eB-y_b0w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Gupta, Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8820=E6=97=A5 09:02, Brian Norris =E5=86=99=
=E9=81=93:
> Apparently I totally ignored the possibility that ECC layouts place
> their metadata in the data area (the 'E' regions above) not just in
> the spare area ('O'). Out of curiosity, is this very common?
>
I think it is not common. AFAIK, only the gpmi uses this layout.

thanks for the rebase.

Huang Shijie
