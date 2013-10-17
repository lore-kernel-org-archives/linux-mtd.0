Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWmeK-0002jV-FG
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 12:25:56 +0000
Message-ID: <525FD715.50703@ti.com>
Date: Thu, 17 Oct 2013 17:54:53 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>, Trent Piepho <tpiepho@gmail.com>, Mark
 Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
References: <52566ACC.1080100@ti.com> <20131010101410.GG21581@sirena.org.uk>
 <52568AA3.9080203@ti.com> <20131011100839.GA21581@sirena.org.uk>
 <525CDB77.4040201@ti.com> <20131015111647.GX2443@sirena.org.uk>
 <525D2BB3.4020705@ti.com> <20131015124656.GM2443@sirena.org.uk>
 <525D41E2.30206@ti.com> <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Peter Korsgaard <peter@korsgaard.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
On Wednesday 16 October 2013 12:03 AM, Gupta, Pekon wrote:
>> From: Trent Piepho
>> Are there any numbers to show if memory mapped read support is a
>> benefit in Linux?  There is some question as to whether it's useful at
>> all or not.
>>
>> If it is, I think low latency for small reads is probably one of the
>> only advantages.  To do that, you aren't going to want to deal with
>> device PM for every single read.  It would make more sense to turn the
>> hardware on when the MTD device is opened and leave it on until
>> closed.
>>
> +1
>
> Therefore early suggestions were to make 'MM_MODE' as default
> (if device enables it via DT). This means:
> (1) switch to 'SPI_MODE' _only_ when required for commands like
>   mtd_erase, etc. and switch back to 'MM_MODE' when done.
> (2) And keep your controller clocks on.
>
> This would ensure that you do minimum config-switching when using
> MM_MODE. And would thus achieve low latency, and no driver intervention.
>
> Yes, real thruput numbers would help clear the picture here ..
>
> with regards, pekon
I did some throughput measurement to get some number on the
read side. Here are my observations:

Case1:
--------
  Using SPI framework.

   Setup:
     Here, the actual memcpy is done in the spi controller, and flash
     communicates to the qspi controller to do the memcpy using the
     SPI framework. This is what is propsed in the $subject patch.

   Measurement method:
     used jiffies_to_msecs  at the beginning and at the end of the 
mtd_read api
    and calculated the difference.

   Result:
      Tried a transfer of 32KB, which takes around 20 ms of time to read.


Case2:
--------
  Bypassing SPI framework.

   Setup:
     Here, the actual memcpy is done in the mtd read api itself, by 
getting the
     memmap address from the spi controller.

   Measurement method:
     used jiffies_to_msecs  before and after memcpy and calculated the 
difference.

   Result:
      Tried a transfer of 32KB, which takes around 10 ms of time to read.

So, time reduced almost to half while bypassing the SPI framework.
