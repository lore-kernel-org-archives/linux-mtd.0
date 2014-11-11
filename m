Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoHrv-000881-Ti
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 20:16:52 +0000
Received: by mail-la0-f54.google.com with SMTP id s18so10279096lam.27
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 12:16:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54626D23.1080003@nod.at>
References: <1415721691-14073-1-git-send-email-fabio.estevam@freescale.com>
 <CAFLxGvwgy-+5K63re678JwcSy2-bNRtDHXiW-1Ve+1En5xHFYg@mail.gmail.com>
 <CAOMZO5A2JJ+HAomy6qDZ6xLf2Bep8R6Jd7O5+N2GkQvtHhm8fg@mail.gmail.com>
 <54626AF4.4090306@nod.at>
 <CAOMZO5AXMjTPPnQtnZUxRmBezoq32wLSCX0iJ30PWa1dZhJ7qQ@mail.gmail.com>
 <54626D23.1080003@nod.at>
Date: Tue, 11 Nov 2014 18:16:29 -0200
Message-ID: <CAOMZO5C3STv-ZsTyXhxs2rhUMM7nu+kuzdAtV_Fo9c5azdeAuA@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove noisy error message
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 11, 2014 at 6:10 PM, Richard Weinberger <richard@nod.at> wrote:

> If the development board has by default no NAND, disable the driver
> in imx28-evk.dts file.

Again, people are free to put a NAND into the socket and just use it.

> You can leave a comment how to enable the driver if an user creates
> a new board based on this eval board with a NAND.

No, I don't think this is a good idea.

BTW, I don't see any other nand driver that prints error on the probe
error path like this one.
