Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX4US-0002yh-E7
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 07:28:56 +0000
Message-ID: <5260E2F7.4020404@ti.com>
Date: Fri, 18 Oct 2013 12:57:51 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Trent Piepho <tpiepho@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Gupta, Pekon" <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
References: <20131015111647.GX2443@sirena.org.uk>	<525D2BB3.4020705@ti.com>	<20131015124656.GM2443@sirena.org.uk>	<525D41E2.30206@ti.com>	<20131015180142.GS23337@ld-irv-0074.broadcom.com>	<CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>	<20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>	<525FD715.50703@ti.com>	<20131017123850.GN2443@sirena.org.uk>	<20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>	<20131017234230.GZ2443@sirena.org.uk>	<5260B3AE.9070308@ti.com>
 <CA+7tXihUBXK61cRDmn3tnY9FM7FUSZrhPpLry2VAfvwWJpJ6gQ@mail.gmail.com>
 <5260D0C7.4000805@ti.com>
In-Reply-To: <5260D0C7.4000805@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Peter Korsgaard <peter@korsgaard.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Balbi, Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
On Friday 18 October 2013 11:40 AM, Sourav Poddar wrote:
> On Friday 18 October 2013 11:26 AM, Trent Piepho wrote:
>> On Thu, Oct 17, 2013 at 9:06 PM, Sourav Poddar<sourav.poddar@ti.com>  
>> wrote:
>>> On Friday 18 October 2013 05:12 AM, Mark Brown wrote:
>>>>> Are you looking for comparison between  read_via_dma() v/s memcpy() ?
>>>> No, I'm looking for a comparison of normal SPI mode (which I'd have
>>>> expected to DMA) and the memcpy() mode.
>>>>
>>>>> If yes, then unfortunately we are bit constrained because our 
>>>>> controller
>>>>> does not support DMA. So, we have to depend on CPU based memcpy()
>>>>> only. However, use of DMA can be added as an independent patch on
>>>>> top of this CASE-2 patch.
>>>> However if the controller can't DMA at all then that's not going to be
>>>> possible...  am I understanding you correctly that normal SPI can't 
>>>> DMA?
>>> Yes, you are correct, the normal SPI cant DMA.
>> Hardware limitation or driver limitation?  Adding DMA support to the
>> driver might be much more useful than adding memory mapped read
>> support.
> Its a hardware limitation, the qspi controller does not support DMA.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
So, consolidating all the comments, this is what can be done to improve the
$subject patch..

1. Keep the qspi controller by default in memory mapped mode.

2. While doing operations other than memory mapped, change the
     controller into config mode and at the end change it into memory mapped
     mode.

3. For filling memory mapped register in qspi controller, we can pass 
that information
     from dt rather than hardcoding as macros.

4. For memory mapped read, do the memcpy in the mtd_read itself and 
bypass the
     SPI framework.
      This has two points to be considered -

     4a.
         Roadblock:
          To get the mem buf from the spi controller to mtd layer
          Solution:
            As suggested by Mark, we can define some apis like
              get_buf/free_buf  in mtd driver and use that to get the
              buf.

     4b.
         Roadblock:
         Runtime clock management is handle by SPI framework, so while
         doing memory read, where we bypass SPI framework, clocks will be
         disable and we will get an abort while doing memcpy.

        Possible solution:
            As suggested by Trent, we can keep the SPI controller clocks 
always ON ?


If the above proposal looks good, should I go ahead and post the next 
updated
patch series?
