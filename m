Received: from web13607.mail.yahoo.com ([216.136.175.118])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WVPV-0001ui-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 05:02:34 +0100
Message-ID: <20010814040820.37578.qmail@web13607.mail.yahoo.com>
Date: Mon, 13 Aug 2001 21:08:20 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: Re: Am29LV065D woes -- ZFMicro MachZ help?
To: Vipin Malik <vipin@embeddedlinuxworks.com>, linux-mtd@lists.infradead.org
In-Reply-To: <5.1.0.14.0.20010813212346.00a6e8d0@mail.spewey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Howdy,

I am excited to get to work tomorrow and pour over the ZFMicro tech docs -
man that sounds sad.

--- Vipin Malik <vipin@embeddedlinuxworks.com> wrote:
> At 05:35 PM 8/13/2001 -0700, Luke wrote:

> Well in that case, you have on board programmable chip select's.
> There must be registers that are associated with each chip select that
> define the base physical address, the databus width, the wait
states,what type of memory is located there (read only or read/write) etc.

You think these registers are located on the ZFMicro chip somewhere,
right?  If I am understanding you correctly, I need to duplicate the
action that the bios does when setting the chip select registers.  

> You must look for these registers and program them to an address that
> you will be happy with. Of course if the flash chips are already booting
> your bios etc. you probably want to dump the contents and decode what
the base address is and just use that.

How would I go about dumping this?  

The bios seems to launch what it calls an Option Rom Extension (A Phoenix
Bios feature - maybe others too) - and the extension it launches is called
the Linux Loader Option Rom Extension.   It is this program that (I
believe) programs the chip selects to get the system booting.  When the
bios first starts it has values in the chip select (mem_cs_0) which allows
this linux loader option rom to load.

> This is exactly like the AMD SC520 processor, except I doubt that the 
> registers to program the chip selects are in the same location :)

I will look more closely at the sc520cdp.c code and hopefully I can just
tweak the appropriate addresses.  So if I create a file zfmicro.c (with
the sc520cdp.c code as a rough template) where do I put this file when
compiling the kernel?  I am new to this kind of thing too (that is messing
with kernel driver source code).

Thanks again!  I am having fun learning how this stuff works! (slowly)

Later,
Luke

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
