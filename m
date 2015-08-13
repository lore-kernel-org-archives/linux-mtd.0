Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ2ao-0008Sx-Os
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 00:11:31 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
Date: Fri, 14 Aug 2015 01:54:47 +0200
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Joachim Eastwood <manabian@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Han Xu <han.xu@freescale.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <201508140109.14149.marex@denx.de> <20150813232447.GJ60523@google.com>
In-Reply-To: <20150813232447.GJ60523@google.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508140154.47179.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, August 14, 2015 at 01:24:47 AM, Brian Norris wrote:
> On Fri, Aug 14, 2015 at 01:09:14AM +0200, Marek Vasut wrote:
> > This is something I don't quite understand. So we have a SPI NOR
> > controller, which as it's own struct device instance.
> 
> Right.
> 
> > This controller can have multiple SPI NORs on it. Each SPI NOR has it's
> > own struct spi_nor instance and struct mtd_info instance, right?
> 
> Right.
> 
> > But, all of the SPI NORs share the same struct device as the controller.
> > Do I understand that correctly ?
> 
> Mostly yes. But your next statement doesn't quite follow in my mind, so
> maybe you've missed something.

I think maybe, just maybe, I should've asked this in an entirely separate
thread, sorry.

> There is typically a single platform device (and associated struct
> device) that represents the fsl-quadspi controller.
> 
> (Pedantic side point: each MTD actually creates one or more struct
> device objects; one for the master MTD, and one for each partition that
> might be created. But I don't think you're asking about these struct
> device's.)

Right.

> But none of this is super-relevant to this patch; I'm not talking about
> struct devices (think kobjects, Linux driver model), I'm dealing with
> struct device_node (think device tree, of_*() APIs, etc.).
> 
> Now, each flash connected to the controller has its own device_node. All
> this patch is saying is that we don't need to know much about that node;
> as long as it responds to the READ ID command properly, spi_nor_scan()
> can autodetect it.

Right.

> > Does that make sense to NOT allocate a new
> > struct device for each of the SPI NORs ?
> 
> I don't quite see how this question relates. Are you suggesting that we
> should be using fewer *device_node* structs? That would involve
> rewriting the device tree, I believe.
> 
> Or perhaps I've misunderstood your train of thought.

Sorry, I should've asked about this in a separate thread.

Best regards,
Marek Vasut
