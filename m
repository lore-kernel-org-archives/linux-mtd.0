Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALY0d-0002H9-KR
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 01:16:55 +0000
To: David Woodhouse <dwmw2@infradead.org>
References: <200311150109.39539.joshua@joshuawise.com>
	<1069021350.3450.65.camel@lapdancer.baythorne.internal>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 16 Nov 2003 18:17:18 -0700
In-Reply-To: <1069021350.3450.65.camel@lapdancer.baythorne.internal>
Message-ID: <m3smknn68x.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Sender: "Eric W. Biederman" <eric@lnxi.com>
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> On Sat, 2003-11-15 at 01:09 -0500, Joshua Wise wrote:
> No. The chip manufacturer did that. Its 'A0' line is what normal people
> would call 'A1', and that's why when you put them in byte mode they also
> have an 'A-1' line, for which someone really deserves to burn in hell.
> 
> The chip in question wants to see a logical '1' on its A1, A3, A5 etc.
> lines for the first unlock cycle, then on A0, A2, A4 etc. for the
> second.
> 
> That corresponds to the CPU's addresses 0xAAA and 0x554, as you've
> observed. In byte mode it's just the _same_, only it also wants a logic
> '1' on its 'A-1' address line too, so the latter address is 0x555.
> 
> Looking at the tables in jedec_probe.c, mostly of the form...
> 
> 		.name		= "Fujitsu MBM29LV400BC",
> 		.uaddr		= {
> 			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
> 			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
> 		},
> ... it looks like they're supposed to be shifted by cfi->device_type
> before actually being used. 

That certainly is not the interpretation the current code gives them.

It looks more like the unlock addresses for x16 mode was incorrectly
specified for this new device.

> But, aside from a brief experiment of
> Thayne's, they aren't actually being shifted. So the [1] /* x16 */ entry
> is wrong, and should be identical to the [0] /* x8 */ one.

For this case that sounds right.  For the general case I don't know.
This sounds like an area where people tend to get confused.

> In fact, I assert that the entries for each device_type should _always_
> be the same. We shouldn't need an array for uaddr; just a single int
> should suffice. Although we do need to mask out the lower bits (0x555
> vs. 0x554).

The array of device type gives us information about which widths
the device actually supports, in addition which unlock addresses
are preset.  So there is value there.

As for the general assertion that unlock address are the same
irregardless of width you may have a point.  But until someone does a
thorough documentation search and shows this to be so for the
currently supported devices I am not ready to accept this.

> I'm going to assert it thusly...
> 
> Thayne? Eric?

You are masking the unlock addresses way to late to be of value.
Things need to be masked out during the probe not when we finally
see what works and decide to set it up.  Not that masking should
make any difference when the address line is not hooked up.

So while the analysis sounds fine I for this particular case,
I think the patch is just wrong and should be backed out.

Eric
