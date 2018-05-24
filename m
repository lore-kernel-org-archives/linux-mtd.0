Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLook-0007yB-GN
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 11:54:04 +0000
Date: Thu, 24 May 2018 13:53:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Benjamin Lindqvist <benjamin.lindqvist@endian.se>
Cc: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>, miquel.raynal@bootlin.com,
 richard@nod.at, marcel@ziswiler.com, krzk@kernel.org, digetx@gmail.com,
 jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, Mirza
 Krak <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RESEND PATCH 2/5] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Message-ID: <20180524135335.6aa0b7a4@bbrezillon>
In-Reply-To: <CAGefG56khQ2835c2QCteit7FuL_yG+APpj6-4vRRPxztFtkAMA@mail.gmail.com>
References: <cover.1526990589.git.stefan@agner.ch>
 <86fdf19ec92b732709732fb60199f16488b4b727.1526990589.git.stefan@agner.ch>
 <CAGefG55kvShaLhNYsFznbOq0_6RNbb+eJ47DLnnU9qRRpwu-iA@mail.gmail.com>
 <d8d6cb9fcd8ce7ea5c13b227012de6d2@agner.ch>
 <CAGefG56khQ2835c2QCteit7FuL_yG+APpj6-4vRRPxztFtkAMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Benjamin,

On Thu, 24 May 2018 13:30:14 +0200
Benjamin Lindqvist <benjamin.lindqvist@endian.se> wrote:

> Hi Stefan,
> 
> It seems to me that a probe similar to what the BootROM does shouldn't
> be awfully complicated to implement - just cycle through the switch
> cases in case of an ECC error. But I guess that's more of an idea for
> further improvements rather than a comment to the patch set under
> review.

Nope, not really an option, because you're not guaranteed that the NAND
will be used as a boot media, and the first page or first set of pages
might just be erased.

> 
> However, I think that allowing for an override of the oobsize
> inference would be a good idea before merging, no? This could just be
> a trivial #ifdef (at least temporarily). If you agree but don't feel
> like doing it yourself, I'd be happy to pitch in. Let me know.

That's why we have nand-ecc-xxx properties in the DT.

Regards,

Boris
