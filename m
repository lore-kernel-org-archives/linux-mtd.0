Received: from web13602.mail.yahoo.com ([216.136.175.113])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WS5k-0001dl-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 01:29:57 +0100
Message-ID: <20010814003549.61100.qmail@web13602.mail.yahoo.com>
Date: Mon, 13 Aug 2001 17:35:49 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: Re: Am29LV065D woes -- ZFMicro MachZ help?
To: Vipin Malik <vipin@embeddedlinuxworks.com>, linux-mtd@lists.infradead.org
In-Reply-To: <5.1.0.14.0.20010812085950.00ace380@mail.spewey.com>
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

I appreciate the help so far - I have been trying to read what I can about
my system.

--- Vipin Malik <vipin@embeddedlinuxworks.com> wrote:
> 
> That's entirely dependent on your hardware- as to which address range it
> decodes the chip select (CS) line going to the flash chip.
...
> If it is going to your (embedded PC on a chip) processor (if that's the 
> case- like in an AMD SC520 or Intel 386EX) then either look in the bios 
> settings where the PAR (programmable address range) chip select
> registers are being set or you may have to program them yourself- say in
> the physmap.c file before you do the probe for the flash chip.

The flash is going directly to the processor.  In this case it is a
ZFMicro MachZ chip (Cyrix 486 dx4) - the documentation on the physical
address space is very confusing to me.  Has anyone tried using MTD for
this chip?

In the bios, one can configure mem_cs_0 (0-3 actually) memory page size,
memory base, and memory offset.  I have 2 Am29LV065D 8M flash chips - one
linked to mem_cs_0 and the other to mem_cs_1.  The confusing part comes
with the Rom Extension Linux Loader that comes with the platform.  Looking
at the assemby for this loader it seems as though it uses the default
settings set in bios for mem_cs_0 and then the loader changes these values
to address an initrd, and kernel address space.  

I am still a little bewildered on how to configure MTD - I am plugging
along reading lots of code.  If anyone has any more suggestions it would
be great!  What kinds of things should I look for in the MachZ
documentation that might help me configure MTD?

Thanks a lot,
Luke 

ps.  Is the prefered setup to have an initrd (with the root fs) or to have
a root jffs2 on a mtd device?  Is this always possible?  


__________________________________________________
Do You Yahoo!?
Send instant messages & get email alerts with Yahoo! Messenger.
http://im.yahoo.com/
