Received: from svenfoo.org ([82.94.215.22] helo=mail.zonque.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG9ox-00078b-B9
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 16:16:28 +0000
Message-ID: <5304D8B8.4010303@zonque.org>
Date: Wed, 19 Feb 2014 17:15:52 +0100
From: Daniel Mack <daniel@zonque.org>
MIME-Version: 1.0
To: =?UTF-8?B?RXplcXVpZWwgR2FyY8OtYQ==?= <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 Pekon Gupta <pekon@ti.com>
Subject: Re: Question about AM335x SoC supported NAND flash
References: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
In-Reply-To: <CAAEAJfD4ddT0Av3ia-+hEf0aXKcyUK4j69YF-t=qTCLkum4a8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/19/2014 05:04 PM, Ezequiel García wrote:
> However, we cannot get the SoC to boot from NAND. We've double-checked
> the hardware
> and the SYSBOOT, but still no luck with it.
> 
> So, I thought about asking here, in case this device is (for some
> reason) not supported by the
> ROM code booting. Maybe someone already struggled with this and has
> some idea to suggest?

We're booting that SoC from an 8-bit NAND, connected to GPMC_CSN0.
SYSBOOT[11:10] is 00b.

The kernel output reads like this:

[    1.320533] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xda
[    1.327280] nand: Toshiba NAND 256MiB 3,3V 8-bit
[    1.332112] nand: 256MiB, SLC, page size: 2048, OOB size: 64
[    1.338077] nand: using OMAP_ECC_BCH8_CODE_HW ECC scheme
[    1.344122] 9 ofpart partitions found on MTD device omap2-nand.0

I wasn't around for early boot-strapping of the platform, so I'm not
aware of any typical pitfalls.

If you want to compare other details between our platforms, let me know.


HTH,
Daniel
