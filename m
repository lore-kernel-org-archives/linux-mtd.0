Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TuoHX-0003vp-9z
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2013 17:57:12 +0000
Received: from [192.168.12.102] (254.sub-70-199-231.myvzw.com [70.199.231.254])
 (authenticated bits=0)
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id r0EHv1m5079753
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jan 2013 09:57:08 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <50F44706.1010206@newsguy.com>
Date: Mon, 14 Jan 2013 09:57:26 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Implementing NAND driver on a PrimeCell SMC PL350 series
References: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
 <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2013 03:02 AM, Ricard Wanderlof wrote:
> 
> On Fri, 11 Jan 2013, Daniel Tang wrote:
> 
>> I'm trying to write a NAND driver for the PL350 memory controller.
>>
>> The problem is that the memory controller abstracts quite a lot of the
>> processes needed to access the NAND. For example, the controller handles all
>> the hardware controlling (like dealing with the CLE and ALE lines). This makes
>> it difficult to write a driver that integrates cleanly with the current NAND
>> subsystem of the kernel.
>>
>> The issue specifically is the cmd_ctrl function that my driver needs to
>> provide. When the kernel needs to write a command and address, it calls the
>> function multiple times to write all the information. E.g. set CLE, write
>> command, set ALE, then write one byte of the page address at a time. The
>> controller, on the other hand, needs all that information to be in a single
>> write to the controller. It does this by embedding the command into the
>> address and have the data value be the page address.
> 
> Have you looked among the existing NAND controller drivers in drivers/mtd/nand
> to see if there's another driver which has similar requirements which you could
> use as a starting point? It's not unusual for NAND controllers to do some of the
> operations automatically, and the mtd framework supports this by letting you
> replace higher-level functions with functions from the driver, and not just the
> low-level functions such as hwcontrol and read_byte.


You might find it helpful to take a look at docg4.c in particular.  This device
is a nand wrapped in a proprietary controller, which sounds similiar to your
hardware.  This device does not have control of low-level lines either.

Hope this helps,
Mike
