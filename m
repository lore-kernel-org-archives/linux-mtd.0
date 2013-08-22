Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCVni-0001OR-6i
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 14:23:50 +0000
Message-ID: <52161ECF.2060700@ti.com>
Date: Thu, 22 Aug 2013 19:53:11 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2]spi: DUAL and QUAD support
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <5216057F.4010900@ti.com> <20130822132122.GK26118@sirena.org.uk>
In-Reply-To: <20130822132122.GK26118@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: spi-devel-general@lists.sourceforge.net, tpiepho@gmail.com,
 linux-mtd@lists.infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 22 August 2013 06:51 PM, Mark Brown wrote:
> On Thu, Aug 22, 2013 at 06:05:11PM +0530, Sourav Poddar wrote:
>> On Sunday 11 August 2013 03:45 PM, wangyuhang wrote:
>>> +		/* check transfer tx/rx_nbits:
>>> +		 * 1. keep the value is not out of single, dual and quad
>>> +		 * 2. keep tx/rx_nbits is contained by mode in spi_device
>>> +		 * 3. if SPI_3WIRE, tx/rx_nbits should be in single
>>> +		 */
>> Sorry for pitchin in a bit late on this.
>> I was trying to use this for my use case today. I realise this check
>> should be under...
> Can you send a patch for this please?
Yes, I will send it.
