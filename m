Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpgNB-0006O9-05
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 11:48:30 +0000
Received: by gyg8 with SMTP id 8so2066646gyg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 04:48:28 -0700 (PDT)
Subject: Re: [PATCH 0/6] davinci: add support for aemif timing configuration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sekhar Nori <nsekhar@ti.com>
In-Reply-To: <1281349000-822-1-git-send-email-nsekhar@ti.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 14:48:21 +0300
Message-ID: <1283082501.2131.29.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Hilman <khilman@deeprootsystems.com>,
	David Woodhouse <dwmw2@infradead.org>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-09 at 15:46 +0530, Sekhar Nori wrote:
> This series of patches adds support for AEMIF timing configuration
> for DaVinci SoCs.
> 
> Currently AEMIF timing configuration is done as a special case for
> DM644x EVM. This work provides for a generic way of doing this.
> 
> David,
> 	Patch 1/6 and 2/6 of this series touch the
> 	drivers/mtd/nand/davinci_nand.c file along with other arch specific
> 	files. Based on the discussion on DaVinci list, Kevin is OK to merge
> 	this with your agreement. Please let us know how to proceed.

Pushed to l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
