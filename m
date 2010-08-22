Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnIu6-0005gb-Gy
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 22:20:39 +0000
Received: by vws11 with SMTP id 11so5283376vws.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 15:20:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282465255.16502.52.camel@brekeke>
References: <4C4DEA3D.5070208@broadcom.com> <4C4F3691.9020505@broadcom.com>
	<1282465255.16502.52.camel@brekeke>
Date: Sun, 22 Aug 2010 15:20:36 -0700
Message-ID: <AANLkTim-XofxxyZt6epCcoQN=PL0vFdT0vjmk_5D=soY@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/nand: Support Micron chips, pagesize >= 4KB
From: Kevin Cernekee <cernekee@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 22, 2010 at 1:20 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> I'm not picking this patch to my l2-mtd-2.6.git, since AFAICS the chips
> support ONFI should be detected properly.
>
> The "older chips" which do not support reading ONFI data can then be
> detected using special quirks. But using heuristics even for the chips
> which do support reading ONFI data sounds bad.

The NAND controllers on certain legacy SoCs are not able to read the
ONFI parameter page, even if the flash device itself supports ONFI.
Consequently, heuristics or a lookup table would need to be used to
determine the device parameters.

Worst case, I guess the Micron ID decoding logic could just be moved
into the low-level driver.
