From: David Woodhouse <dwmw2@infradead.org>
To: tharbaugh@lnxi.com
In-Reply-To: <1094564091.20769.350.camel@tubarao>
References: <20040904173703.GA2100@fluff.org>
	<1094564091.20769.350.camel@tubarao>
Content-Type: text/plain
Date: Tue, 07 Sep 2004 16:08:38 +0100
Message-Id: <1094569718.5122.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ben@fluff.org, linux-mtd@lists.infradead.org, ch@hpl.hp.com
Subject: Re: jedec_probe problems with 16bit devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-07 at 07:34 -0600, Thayne Harbaugh wrote:
> On Sat, 2004-09-04 at 18:37 +0100, Ben Dooks wrote:
> > I have been trying to get an SST 39LF160 on an Simtec Electronics
> > EB2410ITX (aka Bast). I have found some problems with jedec_probe
> > with non-8bit devices.
> 
> > 1) A number of functions are masking out bits from the command
> > addresses, but the cfi_send_gen_cmd() moves the addresses up
> > depending on the chip type, so the masking is not needed.
> 
> Dave, can you comment on this?  It seems like it was something that you
> worked with - something about not probing at unaligned addresses?

The probe code used to probe for impossible combinations at unaligned
addresses. So people hacked around it by masking out the lower bits. Now
we fixed the probe code. Those hacks can go.

> > 2) the cfi_send_gen_cmd() is called with CFI_DEVICETYPE_X8
> > instead of cfi->device_type, which causes the wrong accesses to
> > be generated to the chip.
> 
> It seems like the CFI_DEVICETYPE_X8 was changed to cfi->device_type at
> one point and it broke some 16-bit chips.
> 
> I think all of the CFI_DEVICETYPE_X8s were removed from jedec_probe.c
> 1.30, but then some were added back in at 1.36.  I'm trying to find the
> discussion as to why this happened, but what I'm finding isn't very
> descriptive:

We need to agree --- either we can use cfi->device_type for all, or we
use CFI_DEVICETYPE_X8 for all, and we set the uaddr in the device table
accordingly. 

I think we had CFI_DEVICETYPE_X8 so that we could hard-code different
addresses for different modes of the same chip, on the basis that the
addresses couldn't be calculated from a single entry in the chip table
and the cfi->device_type.

I think that's unnecessary though -- I think we should have only a
_single_ uaddr field in the device table, and use cfi->device_type with
it.

-- 
dwmw2
