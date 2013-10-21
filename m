From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
Date: Mon, 21 Oct 2013 06:01:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA2910B@DBDE04.ent.ti.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
 <5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
 <5264A220.2070900@freescale.com>
In-Reply-To: <5264A220.2070900@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Shijie,

> From: Huang Shijie
>=20
> I am too busy too, i am starting to code the Qspi driver now.
>=20
(1)
Your controller uses LUT based approach, So in case, you are planning to
follow DT based approach of populating flash information in your QSPI
controller then I can help you to put that as part of generic framework
so that both ti-qspi and fsl-qspi can re-use it.

(2)=20
Also, would you be interested in deriving generic framework for serial
NOR something like mtd/spinor/.. where m25p80 can plug-in ?

Based on the following cleaned up version of mtd/spinand/...
https://lkml.org/lkml/2013/6/26/88
by Mona Anonuevo <manonuevo@micron.com>


with regards, pekon
