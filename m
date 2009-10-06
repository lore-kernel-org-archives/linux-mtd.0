Subject: Re: Should flash hardware look like UBI?
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <alpine.LFD.2.00.0910061442530.2638@localhost.localdomain>
References: <1254751504.13096.725.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0910061302350.2638@localhost.localdomain>
	<1254830713.14541.1195.camel@macbook.infradead.org>
	<alpine.LFD.2.00.0910061442530.2638@localhost.localdomain>
Content-Type: text/plain
Date: Tue, 06 Oct 2009 14:07:52 +0100
Message-Id: <1254834472.14541.1331.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-06 at 14:56 +0200, Thomas Gleixner wrote:
> 
> I guess the bad block hiding might work, but I'm concerned about the
> wear levelling aspect. That's what they usually fail to do in a
> sensible way. When the resulting carefully hidden and obscured
> algorithm is just contrary to what the filesystem expects you are
> again digging holes in your device within no time.

Yeah. It makes a lot of sense for the wear levelling to be done
explicitly by the OS, not in the device.

So maybe we don't want the interface to be _quite_ like UBI.

But if we can let the device handle _some_ of the aspects of the
logical<->physical translation, that would be interesting. Partly
because it could do the full scan of the device at startup _internally_,
and it wouldn't slow down the OS.

I'd be happy with limiting it to _just_ what hard drives to; ECC and a
1:1 remapping of blocks. Basically 'hardware acceleration for UBI'.

-- 
dwmw2
