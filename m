Received: from ipmail07.adl2.internode.on.net ([150.101.137.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2JYs-0003AP-V0
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 07:32:31 +0000
Message-ID: <4BC6C0FE.1000701@call-direct.com.au>
Date: Thu, 15 Apr 2010 17:32:14 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Anders Larsen <al@alarsen.net>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
References: <4BC56F21.6040909@call-direct.com.au>
	<1271231840l.5270l.0l@i-dmzi_al.realan.de>
In-Reply-To: <1271231840l.5270l.0l@i-dmzi_al.realan.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anders,

Anders Larsen wrote:
> Hi Iwo,
> 
> On 2010-04-14 09:30:41, Iwo Mergler wrote:
>> I wouldn't recommend that. MTD erase blocks are 64K or more. In a typical
>> embedded system you will not be able to kmalloc that much memory after
>> a few day's of operation - the page pool gets fragmented.
> 
> the original problem occurs with SPI flashes, which typically have a much
> smaller erase block size (and it only occurs when they are driven by an Atmel
> SoC SPI controller, hence the #ifdefs)
> 
>> A possibly better approach is to arrange for that memory to get allocated
>> at driver start time.
> 
> The buffer in question is indeed allocated _once_ (at the first write
> operation to the device) and only deallocated when the device is unmounted,
> so allocating it at driver load time wouldn't make much difference IMHO.
> 

I'm sorry, I thought you were somewhere else in the MTD source.
The bad block handling code for NAND also has a full erase block
allocation, which happens during runtime. 

You are correct in that the mount time allocation should be
safe, for most systems.

Best regards,

Iwo
