Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C4gPR-00007L-8F
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2004 09:53:26 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Ben Dooks <ben-mtd@fluff.org>
In-Reply-To: <20040904173703.GA2100@fluff.org>
References: <20040904173703.GA2100@fluff.org>
Content-Type: text/plain
Date: Tue, 07 Sep 2004 07:34:51 -0600
Message-Id: <1094564091.20769.350.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ben@fluff.org, linux-mtd@lists.infradead.org, ch@hpl.hp.com
Subject: Re: jedec_probe problems with 16bit devices
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-09-04 at 18:37 +0100, Ben Dooks wrote:
> I have been trying to get an SST 39LF160 on an Simtec Electronics
> EB2410ITX (aka Bast). I have found some problems with jedec_probe
> with non-8bit devices.

> 1) A number of functions are masking out bits from the command
> addresses, but the cfi_send_gen_cmd() moves the addresses up
> depending on the chip type, so the masking is not needed.

Dave, can you comment on this?  It seems like it was something that you
worked with - something about not probing at unaligned addresses?

> 2) the cfi_send_gen_cmd() is called with CFI_DEVICETYPE_X8
> instead of cfi->device_type, which causes the wrong accesses to
> be generated to the chip.

It seems like the CFI_DEVICETYPE_X8 was changed to cfi->device_type at
one point and it broke some 16-bit chips.

I think all of the CFI_DEVICETYPE_X8s were removed from jedec_probe.c
1.30, but then some were added back in at 1.36.  I'm trying to find the
discussion as to why this happened, but what I'm finding isn't very
descriptive:

http://lists.infradead.org/pipermail/linux-mtd/2003-October/008685.html

I seem to remember IRC'ing with Christopher Hoover on this.  Maybe he
can remember something?  Christopher?  My memory is somewhat murky.
