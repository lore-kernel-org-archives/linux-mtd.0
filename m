Subject: Re: infineon danube/twinpass mtd support
From: David Woodhouse <dwmw2@infradead.org>
To: john@phrozen.org
In-Reply-To: <20090307133031.448mc2vls04wsgc4@webmail.phrozen.org>
References: <20090307133031.448mc2vls04wsgc4@webmail.phrozen.org>
Content-Type: text/plain
Date: Tue, 17 Mar 2009 10:37:18 +0000
Message-Id: <1237286238.27681.158.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-03-07 at 13:30 +0100, john@phrozen.org wrote:
> 
> we rewrote the infineon danube/twinpass support a while back and  
> bumped the original vendor code to 2.6. we are currently looking into  
> some left over details, before sending the patches upstream.
> 
> 1 open issue is the mtd map. the danube has a EBU (External Bus Unit)  
> which connects pci and mtd to the mips core. for PCI to work, the EBU  
> needs to endiness swap in-/ex-gress DMA data. however, due to a design  
> issue(?!) the EBU only swaps MTD one way. hence we needed to add some  
> complex mappings.

Your issue is that your address lines to the flash are effectively
swapped, so what the _chip_ thinks is address 0x0002 isn't actually
appearing at that location when you try to read/write it.

That doesn't _matter_ for the data, if you're thinking of it as a ROM
chip. You need to be able to just execute code directly from it when the
CPU starts up, and you want to be able to just memcpy directly from it
-- so you want your data to _appear_ unmangled, which means that inside
the _chip_ it's actually swapped. But that doesn't matter because you
have no way of telling unless you take the chip out and put it in a
normal machine or PROM programmer. 

That's just for _data_, though.

The chip _does_ care which address the magic unlock commands are sent
to. It has to be address 0x555 on the chip, otherwise it'll ignore you.

So one option is just to mangle the unlock addresses... except that the
probe is also going to be screwed up because the CFI table is going to
be swapped, too.

I suspect the best answer is to add an extra argument to the map
driver's write function, indicating whether it's a command or data
cycle. And your map driver will only mangle the addresses for the
_command_ cycles.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
