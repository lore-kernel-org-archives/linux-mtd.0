Received: from mail-bn1bon0084.outbound.protection.outlook.com
 ([157.56.111.84] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD427-00089z-Gs
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 05:06:04 +0000
Message-ID: <559E0115.4010304@xilinx.com>
Date: Thu, 09 Jul 2015 07:05:25 +0200
From: Michal Simek <michal.simek@xilinx.com>
MIME-Version: 1.0
To: Josh Cartwright <joshc@ni.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, michal.simek@xilinx.com
CC: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net,
 grant.likely@linaro.org, gregkh@linuxfoundation.org,
 jason@lakedaemon.net, ezequiel.garcia@free-electrons.com,
 arnd@arndb.de, artem.bityutskiy@linux.intel.com,
 jussi.kivilinna@iki.fi, acourbot@nvidia.com, ivan.khoronzhuk@ti.com,
 joern@logfs.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, punnaia@xilinx.com
Subject: Re: [PATCH v7 0/3] Add arm pl353 smc nand driver for xilinx zynq soc
References: <1433786918-21500-1-git-send-email-punnaia@xilinx.com>
 <20150708194051.GP25028@jcartwri.amer.corp.natinst.com>
In-Reply-To: <20150708194051.GP25028@jcartwri.amer.corp.natinst.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/08/2015 09:40 PM, Josh Cartwright wrote:
> On Mon, Jun 08, 2015 at 11:38:35PM +0530, Punnaiah Choudary Kalluri wrote:
>> The following patches add arm pl353 static memory controller driver for
>> xilinx zynq soc. The arm pl353 smc supports two interfaces i.e nand and
>> nor/sram memory interfaces. The current implementation supports only a
>> single SMC instance and nand specific configuration.
> 
> What's the integration plan for this guy?  Looks like we missed 4.2.
> It'd be swell to get have NAND support land for Zynq in 4.3.
> 
> Assuming there is nothing else holding it back:
> 
> Brian- I'm assuming you'll want to take this through your tree.
> 
> It looks like most of the stuff in drivers/memory have historically gone
> through arm-soc/drivers, Michal- does it make sense for you to pick up
> http://lkml.kernel.org/r/1433786857-32575-1-git-send-email-punnaia@xilinx.com?

I am happy to take this via zynq tree and arm-soc tree if this is the
right way.

Josh: Also none can stop you to give us you ACK or Tested-by line.

Thanks,
Michal
