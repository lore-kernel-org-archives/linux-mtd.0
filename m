Subject: Re: [PATCH] mtd: nand: lpc32xx: fix invalid error handling of a
 requested irq
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20161205014710.2015-1-vz@mleia.com>
 <20170103101259.0ec123df@bbrezillon>
Cc: Richard Weinberger <richard@nod.at>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <72ab91ec-a919-af42-8a82-f5d99b245edf@mleia.com>
Date: Tue, 3 Jan 2017 12:16:26 +0200
MIME-Version: 1.0
In-Reply-To: <20170103101259.0ec123df@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 01/03/2017 11:12 AM, Boris Brezillon wrote:
> Hi Vladimir
> 
> On Mon,  5 Dec 2016 03:47:10 +0200
> Vladimir Zapolskiy <vz@mleia.com> wrote:
> 
>> Semantics of NR_IRQS is different on machines with SPARSE_IRQ option
>> disabled or enabled, in the latter case IRQs are allocated starting
>> at least from the value specified by NR_IRQS and going upwards, so
>> the check of (irq >= NR_IRQ) to decide about an error code returned by
>> platform_get_irq() is completely invalid, don't attempt to overrule
>> irq subsystem in the driver.
>>
>> The change fixes LPC32xx NAND MLC driver initialization on boot.
> 
> Do you need to backport this fix to stable releases? If that's the
> case, I'll add the Cc: stable tag when applying.

that will be great if you can add

Cc: stable@kernel.org # v4.7+

Please feel free to add also the tag

Fixes: 8cb17b5ed017 ("irqchip: Add LPC32xx interrupt controller driver")

--
With best wishes,
Vladimir
