Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KxIsk-0008PQ-AS
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 10:11:30 +0000
Message-ID: <49101FCB.8010704@parrot.com>
Date: Tue, 04 Nov 2008 11:11:23 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: bus access for NAND parts
References: <f96d234e0810290454p7c50e9d5t6bd0ecd65444e883@mail.gmail.com>	<f96d234e0810301508n773734efp7a72f3da4ee50841@mail.gmail.com>
	<Pine.LNX.4.64.0810302323100.15815@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0810302323100.15815@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof a écrit :
> On Thu, 30 Oct 2008, Cliff Brake wrote:
> 
>> Correction -- above should say:  "It seems that most devices simply use a
>> _GPIO_ for CE".  The chip select is set low in software, and then
>> multiple bus cycles are run to execute the address and data phases of
>> the NAND operation.  So what keeps another process from interrupting
>> this and running a bus cycle while the GPIO for NAND CE is still low
>> -- which would toggle the strobes to the NAND cs.
> 
> I don't know in general, but in several systems that have multiple buses, 
> the NAND flash can be the only device on a particular bus, so conflicts 
> with other devices are not an issue in those cases. Otherwise, it would be 
> as you say, I agree.
> 
The s3c2412 where the nand bus is shared with SDRAM. nCE is like a gpio
set by software. But it isn't a problem because the nand flash doesn't
care about other bus cycle if nWE/nRE is in high state (see nand
datasheets).

So the arbitration is done with nWE/nRE line and without nCE.

Matthieu
