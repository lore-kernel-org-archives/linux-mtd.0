Subject: Re: Can PYSMAP_COMPAT go?
From: David Woodhouse <dwmw2@infradead.org>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <20100420090408.GM19957@pengutronix.de>
References: <20100420063547.GH19957@pengutronix.de>
	<20100420073503.GL4586@mail.wantstofly.org>
	<1271750733.14748.1580.camel@macbook.infradead.org>
	<20100420090408.GM19957@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Apr 2010 10:20:56 +0100
Message-ID: <1271755256.14748.1583.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-20 at 11:04 +0200, Wolfram Sang wrote:
> Okay, so unless i386 gets device-tree support ;), how about at least
> this?

I'd love to see i386 get device-tree support. OLPC could benefit from it
immediately, and we could start using it on the embedded toys which are
coming out now.

I really don't think 0x4000000 is a 'sensible' default. Zero was better
-- at least the user has to set it to something else. With Hartley's
patch applied, the kernel will no longer crash if it tries to register a
device with zero length (and perhaps it could bail out even sooner if
the length is zero, rather than waiting and noticing the error?).

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
