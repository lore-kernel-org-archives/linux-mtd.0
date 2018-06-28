Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYbQj-0008WN-17
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 18:14:06 +0000
Received: by mail-it0-x242.google.com with SMTP id v83-v6so13882560itc.3
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2018 11:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-5-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <CACRpkdaEsEAiGpieJK1AA8HHLzZc7Tdc932rhdayg06rFU1hNA@mail.gmail.com>
 <MWHPR02MB26232270DED605627B2CF22FAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB26232270DED605627B2CF22FAF4F0@MWHPR02MB2623.namprd02.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Jun 2018 20:13:35 +0200
Message-ID: <CACRpkdZb6NMHtai1DBa+7m2ieZJZiAB7d1vSuP376rHQKpOf+A@mail.gmail.com>
Subject: Re: [[LINUX PATCH v10] 4/4] mtd: rawnand: pl353: Add basic driver for
 arm pl353 smc nand interface
To: nagasure@xilinx.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, Roger Quadros <rogerq@ti.com>,
 Ladislav Michl <ladis@linux-mips.org>, ada@thorsis.com,
 honghui.zhang@mediatek.com,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nagasureshkumarrelli@gmail.com, michals@xilinx.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 28, 2018 at 2:13 PM Naga Sureshkumar Relli
<nagasure@xilinx.com> wrote:


> > This driver has the same problem as the other patches:
> > use the ARM_AMBA primecell magic numbers detection, and the PrimeCell bus.
>
> Here the child is NAND controller and the parent is PL353 SMC,
> so do we need to update this also as AMBA driver?

No, sorry. The parent is spawning another device and you
should indeed use a platform device for that.

Forget this comment.

Yours,
Linus Walleij
