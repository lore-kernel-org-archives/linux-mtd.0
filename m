Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYXpf-0005ti-8C
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 09:00:56 +0000
Message-ID: <52663F57.5060701@freescale.com>
Date: Tue, 22 Oct 2013 17:03:19 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>	<5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
 <5264A220.2070900@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2910B@DBDE04.ent.ti.com>
 <5264E6A9.6070400@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29221@DBDE04.ent.ti.com>
 <5266347A.6060000@freescale.com> <52663895.9040907@ti.com>
In-Reply-To: <52663895.9040907@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B410=E6=9C=8822=E6=97=A5 16:34, Sourav Poddar =E5=86=
=99=E9=81=93:
> Hi Huang,
> Did you get the chance to follow the three patch series which I had sen=
t?
> One of the patch modifies m25p80 to add support for spnasion and=20
> macronix quad read
> support. If that looks cool also to you[1], we can push for that=20
> patch. So that, our further works
> on m25p80 will be reduced.
>
> [1]:  http://permalink.gmane.org/gmane.linux.drivers.mtd/48755
to Brian:
   could you please check Sourav's patch?

If you think his patch is ok, please merge it, and i can do my work base=20
on his patch.

thanks
Huang Shijie
