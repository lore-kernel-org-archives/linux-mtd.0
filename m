Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TtcNf-0008Lk-JC
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 11:02:36 +0000
Date: Fri, 11 Jan 2013 12:02:28 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Daniel Tang <dt.tangr@gmail.com>
Subject: Re: Implementing NAND driver on a PrimeCell SMC PL350 series
In-Reply-To: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
Message-ID: <alpine.DEB.2.00.1301111155250.13078@lnxricardw.se.axis.com>
References: <D9B11571-8012-4206-B903-A4C59B85F318@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 11 Jan 2013, Daniel Tang wrote:

> I'm trying to write a NAND driver for the PL350 memory controller.
>
> The problem is that the memory controller abstracts quite a lot of the 
> processes needed to access the NAND. For example, the controller handles 
> all the hardware controlling (like dealing with the CLE and ALE lines). 
> This makes it difficult to write a driver that integrates cleanly with 
> the current NAND subsystem of the kernel.
>
> The issue specifically is the cmd_ctrl function that my driver needs to 
> provide. When the kernel needs to write a command and address, it calls 
> the function multiple times to write all the information. E.g. set CLE, 
> write command, set ALE, then write one byte of the page address at a 
> time. The controller, on the other hand, needs all that information to 
> be in a single write to the controller. It does this by embedding the 
> command into the address and have the data value be the page address.

Have you looked among the existing NAND controller drivers in 
drivers/mtd/nand to see if there's another driver which has similar 
requirements which you could use as a starting point? It's not unusual for 
NAND controllers to do some of the operations automatically, and the mtd 
framework supports this by letting you replace higher-level functions with 
functions from the driver, and not just the low-level functions such as 
hwcontrol and read_byte.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
