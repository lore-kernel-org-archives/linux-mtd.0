Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WUWM-0001rb-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 04:05:34 +0100
Received: from [203.238.93.91] (helo=hades.idis.co.kr ident=mail)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 15WUc2-0008Qq-00
	for linux-mtd@lists.infradead.org; Tue, 14 Aug 2001 04:11:26 +0100
Received: from cwryu by hades.idis.co.kr with local (Exim 3.32 #1 (Debian))
	id 15WUbG-0000LE-00
	for <mtd@infradead.org>; Tue, 14 Aug 2001 12:10:38 +0900
To: linux-mtd@lists.infradead.org
Subject: Re: Am29LV065D woes -- ZFMicro MachZ help?
References: <20010814003549.61100.qmail@web13602.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: 8bit
From: Changwoo Ryu <cwryu@debian.org>
Date: 14 Aug 2001 12:10:38 +0900
In-Reply-To: Luke's message of "Mon, 13 Aug 2001 17:35:49 -0700 (PDT)"
Message-ID: <87u1zbgwup.fsf@hades.idis.co.kr>
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

Luke <luke_epsilon@yahoo.com> writes:

> I appreciate the help so far - I have been trying to read what I can about
> my system.
> 
> --- Vipin Malik <vipin@embeddedlinuxworks.com> wrote:
> > 
> > That's entirely dependent on your hardware- as to which address range it
> > decodes the chip select (CS) line going to the flash chip.
> ...
> > If it is going to your (embedded PC on a chip) processor (if that's the 
> > case- like in an AMD SC520 or Intel 386EX) then either look in the bios 
> > settings where the PAR (programmable address range) chip select
> > registers are being set or you may have to program them yourself- say in
> > the physmap.c file before you do the probe for the flash chip.
> 
> The flash is going directly to the processor.  In this case it is a
> ZFMicro MachZ chip (Cyrix 486 dx4) - the documentation on the physical
> address space is very confusing to me.  Has anyone tried using MTD for
> this chip?
> 
> In the bios, one can configure mem_cs_0 (0-3 actually) memory page size,
> memory base, and memory offset.  I have 2 Am29LV065D 8M flash chips - one
> linked to mem_cs_0 and the other to mem_cs_1.  The confusing part comes
> with the Rom Extension Linux Loader that comes with the platform.  Looking
> at the assemby for this loader it seems as though it uses the default
> settings set in bios for mem_cs_0 and then the loader changes these values
> to address an initrd, and kernel address space.  

You don't need the register values (set by the linux loader) after
linux/initrd loading.  Then the regsiter values should be changed
before probing the flash.

You can read the H/W manual "ZF-Logic" section about setting the
values.

-- 
Changwoo Ryu
