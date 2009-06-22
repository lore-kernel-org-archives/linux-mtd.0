Received: from 130.120.124.202.static.snap.net.nz ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MIb4A-0002at-Ki
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 04:23:41 +0000
Message-ID: <4A3F07C0.9030001@bluewatersys.com>
Date: Mon, 22 Jun 2009 16:25:36 +1200
From: Ryan Mallon <ryan@bluewatersys.com>
MIME-Version: 1.0
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [spi-devel-general] [PATCH] SST25L (non JEDEC) SPI Flash driver
References: <4A3F017B.2010409@bluewatersys.com>
	<20090622041457.GC6027@tarshish>
In-Reply-To: <20090622041457.GC6027@tarshish>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux kernel <linux-kernel@vger.kernel.org>,
	mike@steroidmicros.com, spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Baruch Siach wrote:
> Hi Ryan,
> 
> On Mon, Jun 22, 2009 at 03:58:51PM +1200, Ryan Mallon wrote:
>> +static int sst25l_erase_block(struct sst25l_flash *flash, u32 offset)
>> +{
>> +	u8 command[4];
>> +	int err;
>> +
>> +	err = sst25l_write_enable(flash, 1);
> 
> Is this enable/disable strictly required for each write/erase? Can't we just 
> enable write once?

The datasheet says that prior to any write/erase instruction the write
enable instruction must be sent.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Ryan Mallon                              Unit 5, Amuri Park
       Phone: +64 3 3779127                     404 Barbadoes St
       Fax:   +64 3 3779135                     PO Box 13 889
       Email: ryan@bluewatersys.com             Christchurch, 8013
       Web:   http://www.bluewatersys.com       New Zealand
       Freecall Australia  1800 148 751         USA 1800 261 2934
