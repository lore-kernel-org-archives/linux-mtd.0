Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgsTQ-0002FV-Sd
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 04:54:33 +0000
Received: by fxm3 with SMTP id 3so3248630fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 21:54:31 -0700 (PDT)
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from
	NAND device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
In-Reply-To: <201007290047.06394.ffainelli@freebox.fr>
References: <201007290047.06394.ffainelli@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 07:54:19 +0300
Message-Id: <1280984059.1175.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Brian Norris <norris@broadcom.com>, Maxime Bizon <mbizon@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-29 at 00:47 +0200, Florian Fainelli wrote:
> A nand_chip which has valid ONFI parameters gets its options field updated
> with the NAND_ONFI flag. In that case both the ONFI version (in BCD format)
> as well as the complete page parameters is available in the struct nand_chip.
> This allows for better detection of some new devices, as well as fine tuning of
> NAND driver timings. This patch only adds support for ONFI 1.0 parameters.
> 
> Signed-off-by: Maxime Bizon <mbizon@freebox.fr>
> Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>

I assume you will send v2 of this patch, so not taking this one.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
