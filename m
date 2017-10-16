Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e42sv-0005aI-0N
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 10:44:38 +0000
Received: by mail-oi0-x232.google.com with SMTP id c77so24397355oig.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Oct 2017 03:44:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171016095155.29174-2-s.hauer@pengutronix.de>
References: <20171016095155.29174-1-s.hauer@pengutronix.de>
 <20171016095155.29174-2-s.hauer@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Oct 2017 08:44:15 -0200
Message-ID: <CAOMZO5C=E45-w4eEyDZMegiFiRd7QrzRgsjCMEpfKJz-ieXApQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: mxc: lower ECC failed message priority to
 debug level
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Sascha Hauer <kernel@pengutronix.de>, Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Mon, Oct 16, 2017 at 7:51 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> Having bad ECC is a normal case for NAND, do not spam log with the
> message. Users like UBI will print a message anyway which is more
> useful since it contains the PEB number that has bad ECC.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Yes, I also get this spammed log on a mx25pdk:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
