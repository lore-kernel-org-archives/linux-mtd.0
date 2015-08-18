Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRVly-0002qe-78
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 01:33:07 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] [PATCH v4] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Tue, 18 Aug 2015 03:32:41 +0200
Cc: linux-mtd@lists.infradead.org, Viet Nga Dao <vndao@altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Rafa?? Mi??ecki" <zajec5@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>
References: <1433316644-3748-1-git-send-email-vndao@altera.com>
 <201508171953.23955.marex@denx.de> <20150818012444.GA17499@localhost>
In-Reply-To: <20150818012444.GA17499@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508180332.41805.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 18, 2015 at 03:24:44 AM, Brian Norris wrote:
> I'm not very helpful here, so hopefully Viet can be of more use:

Yup :)

> On Mon, Aug 17, 2015 at 07:53:23PM +0200, Marek Vasut wrote:
> > On Monday, August 17, 2015 at 06:03:38 PM, Brian Norris wrote:
> > Also, I cannot find any documentation for this IP block even if I search
> > through Quartus/QSys, is there any proper documentation available
> > anywhere?
> 
> I never found proper documentation, but I didn't look too hard. I've
> mostly been going off of Viet's comments and code.

Me neither, and I looked through the altera stuff in fact. I'm trying
to learn whether this is just an Soft IP, in which case it certainly
can be fixed ; or if there is actually some chip shipping with this
crap synthesised into actual silicon.

> But FWIW, I did find some relevant info for the peculiar Altera EPCQ
> flash here:
> 
> https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/
> hb/cfg/cfg_cf52012.pdf

Altera EPCS/EPCQ flashes are just rebranded micron flashes, they just have 
different JEDEC ID and are a bit more expensive.

Best regards,
Marek Vasut
