Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH4Co-0004DO-4j
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 09:53:30 +0000
Date: Mon, 29 Oct 2018 10:51:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michals@xilinx.com>, <nagasuresh12@gmail.com>
Subject: Re: [LINUX PATCH v11 0/3] Add support for Arasan NAND Flash controller
Message-ID: <20181029105108.562ddd21@xps13>
In-Reply-To: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1537878031-22253-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
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

Hi Naga,

Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote on
Tue, 25 Sep 2018 17:50:28 +0530:

> This patch series adds the basic driver support for Arasan NAND Flash con=
troller.
> We are reinitiating the patch series by fixing the comments given by Miqu=
el and Boris.
> Major changes are exec_op() implementation related.
> Rebased to 4.19 nand tree.
> Tested MT29F32G08ABCDBJ4.
>=20
> As suggested by Boris, it also adds a new varaible called mode in
> struct nand_sdr_timings, which will give directly the sdr operating
> mode. and it is useful for some controllers, where we can configure
> direclty the operating mode instead of timings.
>=20

Unless I missed something there are still comments from Boris pending?
I will wait for your v12 to give this driver another shot.

Thanks,
Miqu=C3=A8l
