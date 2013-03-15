Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGZ67-0004Ke-GG
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 18:11:27 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: RE: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
Date: Fri, 15 Mar 2013 18:11:05 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9A288C@DBDE01.ent.ti.com>
References: <1363352378-2825-1-git-send-email-pekon@ti.com>,
 <51431F08.7050103@parrot.com>
In-Reply-To: <51431F08.7050103@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On which controller was it tested ?

[Pekon]: I tested it on TI's omap controller itself :-)
However I ran following, to confirm..
(1) mtd_subpagetest: part of MTD tests
(2) ubiattach & ubiformat of ubi image built with Volume Header at 512 offs=
et
that is using -O 512.
(3) nand raw read / write with non-page aligned data.

Do you have any other tests in mind ?


> The problem is that lot's of controller driver with hw ecc hack the ecc i=
nterface.

> For example the TI omap driver don't use the data pointer of ecc.calculat=
e but
> use the data send on the nand interface.

[Pekon]: Yes i agree. But what I see in TI's hack also that ECC is calculat=
ed for=20
each subpage separately. Its just that instead of using data in=20
chip->buffers->databuf
TI's driver uses data which is present in controller's internal buffers, wh=
ich=20
should be the way if we are depending on Hardware (controller) to do ECC.
Is this something different from other Hardware based ECC implementations?


[Pekon]: Also, its not just doing sub-page writes, rather its actually mask=
ing=20
other sub-pages with 0xFF. And also their corresponding ECC .
This is done, because even though some NANDs support sub-page accesses,
but the actual PAGE-PROGRAM NAND command which actually flashes the=20
data present in device buffers to array cells, works at page boundaries.

I'm following similar to what is given at
http://www.linux-mtd.infradead.org/doc/ubi.html#L_subpage


> Matthieu

with regards, pekon=
