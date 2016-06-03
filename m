Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8xUp-0003Lv-Pz
 for linux-mtd@lists.infradead.org; Fri, 03 Jun 2016 22:23:16 +0000
Received: by mail-wm0-x244.google.com with SMTP id a136so2317139wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2016 15:22:55 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
Cc: Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 Han Xu <han.xu@nxp.com>, linux-spi@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
Date: Sat, 4 Jun 2016 00:22:37 +0200
MIME-Version: 1.0
In-Reply-To: <20160506121431.GQ6292@sirena.org.uk>
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

Am 06.05.2016 um 14:14 schrieb Mark Brown:
> On Thu, May 05, 2016 at 04:57:00PM -0700, Brian Norris wrote:
>> On Thu, Apr 07, 2016 at 09:09:56PM +0200, Heiner Kallweit wrote:
> 
>>> 2. At least in the case of fsl-espi the size limit refers to one
>>>    physical transfer (including the command) and therefore to the sum
>>>    of all transfers.
>>> We should change
>>> +	t[1].len = min_t(size_t, len, spi_max_transfer_size(spi));
>>> to
>>> +	t[1].len = min(len, spi_max_transfer_size(spi) - t[0].len);
>>>
>>> Apart from that the patch set looks good to me.
> 
>> That's not what Mark specified here:
> 
>> http://lists.infradead.org/pipermail/linux-mtd/2015-November/063616.html
> 
>> and that's not what the API's very *name* means; it says max transfer
>> size (where a spi_transfer is a very well-defined concept). You need to
>> fix the driver or take up the API issues with Mark if you want to
>> suggest we interpret this differently.
> 
> Yes, it's called the maximum transfer size because it is the maximum
> size of a transfer, not because it's the maximum size of a message.
> 
I'd like to come back to this discussion. You said best would be to fix
the chip driver. To do this and calculate an appropriate value for
max_transfer_size the chip driver would have to know that the spi_device
is a spi-nor device.
We could check that the name of the driver bound to the spi-device is m25p80.
This doesn't sound very nice.

Or maybe better, struct spi_device could be extended by a pointer to a struct spi_nor.
This comment in the definition of struct spi_device seems to point in this direction:
"likely need more hooks for more protocol options affecting how the controller
talks to each chip"
Just storing the length of the read command + dummy bytes would also be sufficient.
Could this be a feasible way?
