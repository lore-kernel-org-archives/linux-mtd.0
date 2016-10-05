Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brkQN-0005p8-Sr
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 11:31:48 +0000
Subject: Re: [PATCH v3 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
To: Mika Westerberg <mika.westerberg@linux.intel.com>
References: <1471245044-12767-1-git-send-email-mika.westerberg@linux.intel.com>
 <2cf1530a-8e10-9a4a-51a4-8ae322b26ed9@denx.de>
 <20161005102700.GD1765@lahna.fi.intel.com>
 <8fef3d44-dc1e-2175-b335-9f025b302ab1@denx.de>
 <20161005111850.GG1765@lahna.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
From: Stefan Roese <sr@denx.de>
Message-ID: <b0b5aa23-bbc6-a2c4-8671-a50a4735ec15@denx.de>
Date: Wed, 5 Oct 2016 13:31:20 +0200
MIME-Version: 1.0
In-Reply-To: <20161005111850.GG1765@lahna.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05.10.2016 13:18, Mika Westerberg wrote:
> On Wed, Oct 05, 2016 at 01:11:39PM +0200, Stefan Roese wrote:
>> [    3.654301] intel-spi intel-spi: OPMENU0=0x00009f0b
>> [    3.654304] intel-spi intel-spi: OPMENU1=0x00000000
>> [    3.654306] intel-spi intel-spi: BCR=0x00000009
>> [    3.654308] intel-spi intel-spi: Protected regions:
>> [    3.654313] intel-spi intel-spi: Flash regions:
>> [    3.654316] intel-spi intel-spi:  00 base: 0x00000000 limit: 0x00000fff
>> [    3.654320] intel-spi intel-spi:  01 base: 0x00300000 limit: 0x007fffff
>> [    3.654323] intel-spi intel-spi:  02 base: 0x00001000 limit: 0x002fffff
>> [    3.654325] intel-spi intel-spi:  03 disabled
>> [    3.654328] intel-spi intel-spi:  04 disabled
>> [    3.654330] intel-spi intel-spi: Using SW sequencer for register access
>> [    3.657488] intel-spi intel-spi: s25fl064k (8192 Kbytes)
>> [    3.677241] Creating 1 MTD partitions on "intel-spi":
>> [    3.682310] 0x000000000000-0x000000800000 : "BIOS"
>
> Cool!
>
>> So how do you suggest to support such BayTrail boards booting
>> via U-Boot as bootloader? Should U-Boot write something into
>> these OPMENU0/1 registers before booting into Linux?
>
> Typically it's the BIOS who does that so I guess in your case it should
> be U-Boot then. I would not like to add that part to the driver itself
> unless absolutely necessary ;-)

Sure, I can definitely add something here in U-Boot. Since I'm
pretty new to this driver / controller and its interface to the BIOS,
could you perhaps suggest those values please? To enable the Linux
driver with full read-write support to such chips?

Thanks,
Stefan
