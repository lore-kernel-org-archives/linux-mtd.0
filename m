Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V97rO-0006bw-Ll
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 06:13:39 +0000
Message-ID: <5209CEA8.9070504@freescale.com>
Date: Tue, 13 Aug 2013 14:14:00 +0800
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
 <5208AE99.6020508@freescale.com> <20130813002512.GC7267@brian-ubuntu>
 <20980858CB6D3A4BAE95CA194937D5E73E9F4173@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F4173@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

=E4=BA=8E 2013=E5=B9=B408=E6=9C=8813=E6=97=A5 12:29, Gupta, Pekon =E5=86=99=
=E9=81=93:
> (1) Huang's current patch set (v3)
> >  (2) My proposed naming above
> >  (3) A third option? (AFAICT, (1) or (2) should be satisfactory)
> > =20
> >  If we go with (2), the v4 patch series only needs to take care of th=
e
> >  new sysfs naming (plus documentation) and the new mtd_info field nam=
ing.
I agree with the renaming, i will wait for several days, and send out=20
the v4.

thanks
Huang Shijie
