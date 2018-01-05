Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXU98-0001bY-Ot
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 15:43:04 +0000
Date: Fri, 5 Jan 2018 16:42:39 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Han Xu
 <han.xu@nxp.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: Check ONFI timings have been acked by
 the chip
Message-ID: <20180105164239.79d7980c@xps13>
In-Reply-To: <20180105161321.44218e4e@bbrezillon>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
 <20171222172853.27710-2-miquel.raynal@free-electrons.com>
 <20180105161321.44218e4e@bbrezillon>
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

Hello,

> Hm, I'm not sure this is safe. The spec says that new ONFI timing mode
> is applied as soon the CS line is released after a
> SET_FEATURES(ONFI_FEATURE_ADDR_TIMING_MODE), and since we have no
> guarantee that the CS will be kept low by the controller after
> ->onfi_set_features() returns we must assume the new mode has been =20
> applied and call ->setup_data_interface() to instruct the controller
> to apply new timings.
>=20
> If you want to check if the mode has really been applied, you should
> release the CS (->select_chip(-1)), re-acquire it
> (->select_chip(X)), and call
> ->onfi_get_features(ONFI_FEATURE_ADDR_TIMING_MODE). If it appears
> that the mode has not been applied, you should restore timing mode 0
> and issue a RESET.

Boris, thanks for the comment, I will fix that.

Han, could I have your input on this series? Aside Boris' comment of
course.

Thank you very much,
Miqu=C3=A8l
