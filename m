From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3smknn68x.fsf@maxwell.lnxi.com>
References: <200311150109.39539.joshua@joshuawise.com>
	 <1069021350.3450.65.camel@lapdancer.baythorne.internal>
	 <m3smknn68x.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1069059313.4490.33.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 Nov 2003 08:55:14 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Thayne Harbaugh <tharbaugh@lnxi.com>
Subject: Re: JEDEC probing redux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2003-11-16 at 18:17 -0700, Eric W. Biederman wrote:
> It looks more like the unlock addresses for x16 mode was incorrectly
> specified for this new device.

Well, it was right at the time, because on the day I added it we _were_
shifting unlock addresses by device_type.

> For this case that sounds right.  For the general case I don't know.
> This sounds like an area where people tend to get confused.

The confusion is mostly because of the idiotic nomenclature of the
address lines. You end up with stuff like the Toshiba TC58FVT160
datasheet, which says:
	"The system should generate the following address patterns:
	"Word mode: 555H or 2AAH to addresses A10 to A0.
	"Byte mode: AAAH or 555H to addresses A10 to A-1."

Now couldn't that have been explained more sanely?

> > In fact, I assert that the entries for each device_type should _always_
> > be the same. We shouldn't need an array for uaddr; just a single int
> > should suffice. Although we do need to mask out the lower bits (0x555
> > vs. 0x554).
> 
> The array of device type gives us information about which widths
> the device actually supports, in addition which unlock addresses
> are preset.  So there is value there.
> 
> As for the general assertion that unlock address are the same
> irregardless of width you may have a point.  But until someone does a
> thorough documentation search and shows this to be so for the
> currently supported devices I am not ready to accept this.

Chips which currently have differing unlock addresses in the table:

Toshiba TC58FV[BT]{160,321,641}
Macronix MX29LV160][TB]
Fujitsu MBM29LV{160,320,400,800}xx
AMD AM29LV{160,400,800},AM29F800BT.

I checked the datasheets for the Toshiba TC58FV[BT]160, the Macronix
MX29LV160[BT], the AMD 29LV400, and the Fujitsu MBM29LV160[TB].

They all agree; it's 0x555,0x2AA on A0 upwards in word mode, or
0xAAA,0x555 on A-1 upwards in byte mode -- i.e. the same voltages on the
same pins, except for the logic 1 on A-1 in the second cycle in byte
mode.

One from each family is enough to convince me. 

> > I'm going to assert it thusly...
> > 
> > Thayne? Eric?
> 
> You are masking the unlock addresses way to late to be of value.
> Things need to be masked out during the probe not when we finally
> see what works and decide to set it up. 

True; I fixed that in CVS already.

>  Not that masking should make any difference when the address
>  line is not hooked up.

It triggers an alignment trap, which does two word reads and two word
writes with one byte changed... :)

> So while the analysis sounds fine I for this particular case,
> I think the patch is just wrong and should be backed out.

I think the analysis sounds fine for all cases, and I fixed the patch.
Happier now? I'm leaving the code as-is for a while, so anyone who
reports problems can revert. Once we know it works in practice as well
as in theory, we can take it out, if we've found a replacement for the
information about what device types are supported by each chip.

-- 
dwmw2
