Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUSFx-0001b8-U6
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 08:10:08 +0000
Date: Wed, 5 Dec 2018 09:09:54 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 5/6] mtd: spi-nor: Add an SPDX tag to spi-nor.c
Message-ID: <20181205090954.47b3e03c@bbrezillon>
In-Reply-To: <67f33c22-468e-919e-0790-1819b5601a17@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-6-boris.brezillon@bootlin.com>
 <67f33c22-468e-919e-0790-1819b5601a17@microchip.com>
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

On Tue, 4 Dec 2018 19:45:51 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/29/2018 04:10 PM, Boris Brezillon wrote:
> > Add an SPDX tag to replace the license boiler-plate and fix the
> > MODULE_LICENSE() definition to match the the license (GPL v2).
> >   
> 
> Can we add the spdx tag for include/linux/mtd/spi-nor.h in the same patch?

Absolutely. I'll fix that.
