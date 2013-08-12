Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8mcs-0000Za-M0
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 07:33:15 +0000
Message-ID: <52088E46.7030307@freescale.com>
Date: Mon, 12 Aug 2013 15:27:02 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 01/10] mtd: set the cell information for ONFI nand
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8812=E6=97=A5 15:22, Gupta, Pekon =E5=86=99=
=E9=81=93:
> [Pekon]: For future scalability, good to update only MLC related bit-fi=
elds
> So ORing instead of assigning..
> chip->cellinfo |=3D (p->bits_per_cell - 1)<<  NAND_CI_CELLTYPE_SHIFT;
>
thanks for review.

yes, use the ORing is better. I will fix it in the next version.

thanks
Huang Shijie
