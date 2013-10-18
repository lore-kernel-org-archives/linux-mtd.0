Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX1L4-00006B-RA
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 04:07:03 +0000
Message-ID: <5260B3AE.9070308@ti.com>
Date: Fri, 18 Oct 2013 09:36:06 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
References: <20131015111647.GX2443@sirena.org.uk> <525D2BB3.4020705@ti.com>
 <20131015124656.GM2443@sirena.org.uk> <525D41E2.30206@ti.com>
 <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
 <20131017234230.GZ2443@sirena.org.uk>
In-Reply-To: <20131017234230.GZ2443@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Peter Korsgaard <peter@korsgaard.com>,
 Brian Norris <computersforpeace@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, Trent Piepho <tpiepho@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 October 2013 05:12 AM, Mark Brown wrote:
> On Thu, Oct 17, 2013 at 01:03:26PM +0000, Gupta, Pekon wrote:
>
>> mtd_read() {
>> 	if (flash->mmap_mode)
>> 		if (dma_available)
>> 			read_via_dma(destination, source, length);
>> 		else
>> 			memcpy(destination, source, length);
>> 	else
>> 		/* use spi frame-work by default */
>> }
>> Are you looking for comparison between  read_via_dma() v/s memcpy() ?
> No, I'm looking for a comparison of normal SPI mode (which I'd have
> expected to DMA) and the memcpy() mode.
>
>> If yes, then unfortunately we are bit constrained because our controller
>> does not support DMA. So, we have to depend on CPU based memcpy()
>> only. However, use of DMA can be added as an independent patch on
>> top of this CASE-2 patch.
> However if the controller can't DMA at all then that's not going to be
> possible...  am I understanding you correctly that normal SPI can't DMA?
Yes, you are correct, the normal SPI cant DMA.
