Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqoOV-0000Ph-4v
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 22:06:17 +0000
Date: Wed, 22 Mar 2017 23:05:53 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 02/13] mtd: nand: fsmc: rework fsmc_nand_setup() to use
 ->setup_data_interface()
Message-ID: <20170322230553.5daf0562@free-electrons.com>
In-Reply-To: <20170322225617.313aa805@bbrezillon>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490090645-8576-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170322225617.313aa805@bbrezillon>
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

Hello,

On Wed, 22 Mar 2017 22:56:17 +0100, Boris Brezillon wrote:

> I'm not sure this is such a good idea to move default and DT timings
> setting in the ->setup_data_interface() hook.
> 
> ONFI NANDs are changing an internal parameter to switch to a specific
> timing mode. If you let the core think that you configured the
> controller to support this timing mode, while you actually configured
> it with the default or DT timings it might not work as expected.

So what do you suggest to keep the compatibility with the existing DT
binding for this NAND controller?

We also need to take into account that the timings need to be
reconfigured upon ->resume().

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
