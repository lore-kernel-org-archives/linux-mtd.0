Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVmJA-0007dr-Qy
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 16:47:25 +0000
Message-ID: <50993F16.8070908@parrot.com>
Date: Tue, 6 Nov 2012 17:47:18 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 3/3] omap3 nand : use NAND_BUSWIDTH_AUTO
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1352199105-30215-3-git-send-email-matthieu.castet@parrot.com>
 <50990473.2090300@compulab.co.il>
In-Reply-To: <50990473.2090300@compulab.co.il>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, Afzal Mohammed <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Igor Grinberg a écrit :
> Cc: Tony Lindgren, Afzal Mohammed,
> 
> On 11/06/12 12:51, Matthieu CASTET wrote:
>> This allow to clean the omap nand driver that were trying in x8 and x16 bits mode.
>>
>> This also make work onfi detection on beagleboard :
>>
>> Before :
>> [    1.954803] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron NAND 256MiB 1,8V 16-bit), page size: 2048, OOB size: 64
>>
>> After :
>> [    1.914825] ONFI param page 0 valid
>> [    1.919158] ONFI flash detected
>> [    1.922515] NAND device: Manufacturer ID: 0x2c, Chip ID: 0xba (Micron MT29F2G16ABD), page size: 2048, OOB size: 64
>>
>> platform data devsize is renamed bussize. It now indicate the maximun size of the nand bus.
>>
>> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> 
> I think, you should base on one of Tony's branches with that kind of patches.
> Because, for example the omap_nand_flash_init() function does not exist anymore
> in Tony's master and may be several more things will need to have adjustments.
> Also, the GPMC related stuff inside the NAND driver
> should probably be coordinated with Afzal, as he is reworking the whole
> GPMC related code.

Thanks for the info.

Where such tree could be found ?


Matthieu
