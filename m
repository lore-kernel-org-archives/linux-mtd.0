Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HuuOR-0001DS-QC
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 14:01:34 -0400
Message-ID: <46630256.8050909@ru.mvista.com>
Date: Sun, 03 Jun 2007 22:03:02 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<1180769992.14025.1.camel@localhost.localdomain>
	<4662E7EA.70506@ru.mvista.com>
	<d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>
In-Reply-To: <d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ppcdev <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Segher Boessenkool wrote:
>>> If it's a flash, compatible should be the chip type, and maybe as a
>>> second entry, what type of flash protocol (amd, intel, cfi, ...) it's
>>> compatible.
>>     As I've already (and repatedly) stated before,

> And you repeatedly got answers too, yet you choose
> to rehash this whole discussion again.

    Not I have started it. And I have my reasons, too. :-)

>> this gets you *nothing* WRT
>> selecting the proper driver in the current Linux MTD subsystem.

> Which Linux driver to use is not something that should
> be (directly) communicated in a device tree -- even if

    Bah... what's "name" and "compatible" properties are for then. Nobody's 
talking about the direct match but making the task of selecting a proper 
driver more complex by specifying the details that don't help (if not hinder) 
the correct selection is certainly not a way to go.

> you take the position the device tree is a nice big
> configuration file for Linux, what if a new Linux flash
> subsystem shows up (or even simply a driver got renamed,
> etc.)

    There is no direct match in *this* case (for an example of such, refer to 
FSL "gianfar" nodes ;-).

> -- the device tree on your board doesn't necessarily
> change when your kernel version does.

    Well, I'm not anticipating any changes either in this case...

>> What it
>> actually *needs* to know is flash mapping information,

> It needs to know what kind of flash it is, and how it
> is connected -- i.e., it needs to describe the hardware.
> How Linux then decides to use it is its own game, but
> at least the device tree puts all the information it
> could possibly need out there.

>> the CFI/JEDEC interface then can be deduced by probing

> Most of the time, sure.  Not always.

    That's the way the cookie crumbles in Linux MTD for now. It's *always* 
detecting this by probing -- you only can say what [not] to probe.

>> -- so, this property ("ptobe-type"), although specified in 
>> Documentation/powerpc/booting-without-of.txt, is optional.

> Who is talking about "probe-type"?  We are talking about "compatible". 

    See my other mail where I've told why I don't consider your example of 
this prop valid...

> Segher

WBR, Sergei
