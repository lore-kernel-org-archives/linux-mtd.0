Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8oft-0003uk-Sv
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 09:44:30 +0000
Message-ID: <5208AE99.6020508@freescale.com>
Date: Mon, 12 Aug 2013 17:44:57 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v3 3/6] mtd: set the ecc step size for master/slave
 mtd_info
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
 <1376285092-19683-4-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
 <52089C91.4090903@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F2B57@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F2B57@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8812=E6=97=A5 17:24, Gupta, Pekon =E5=86=99=
=E9=81=93:
> [Pekon]: Following Artem's recommendations.. Can this be named as
> chip->ecc.size =3D ecc_step_size.
> then chip->ecc.bytes  =3D ecc_syndrome_size (or ecc_code_size)
yes, we can rename these fields in the future with another patch set.


> In addition, chip->ecc.bytes should also be helpful for userspace
> utility to determine how much bytes to reserve in spare-area for ECC.
> So exposing that as sysfs entry is also good.
>
I do not need the chip->ecc.bytes. :)
For me, export the chip->ecc.size is enough.

So you can submit a patch if you need this field.

thanks
Huang Shijie
