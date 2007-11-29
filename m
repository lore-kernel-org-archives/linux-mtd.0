Received: from lixom.net ([66.141.50.11] helo=mail.lixom.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxX6k-0003v7-IQ
	for linux-mtd@lists.infradead.org; Thu, 29 Nov 2007 00:18:28 +0000
Date: Wed, 28 Nov 2007 18:21:31 -0600
From: Olof Johansson <olof@lixom.net>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MTD: pasemi_nand driver
Message-ID: <20071129002131.GA2433@lixom.net>
References: <20071128221448.GA1144@lixom.net>
	<1196289632.27384.0.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1196289632.27384.0.camel@shinybook.infradead.org>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 28, 2007 at 10:40:32PM +0000, David Woodhouse wrote:
> 
> On Wed, 2007-11-28 at 16:14 -0600, Olof Johansson wrote:
> > Plumbing for NAND connected via localbus on PA Semi PWRficient-based
> > boards.
> 
> Any reason it lacks MODULE_DEVICE_TABLE() ?
> 
> I note electra-ide lacks it too. So no autoload of either.

Nope, no good reason. I'll add one. Josh pointed out <stdfeedback.h>,
d.v.s of_platform.h as well so I have to repost with that too.


-Olof
