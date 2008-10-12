Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Koyad-0002BT-M6
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 10:54:24 +0000
Date: Sun, 12 Oct 2008 11:43:50 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081012104349.GC29975@flint.arm.linux.org.uk>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
	<1223807730.6770.387.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1223807730.6770.387.camel@macbook.infradead.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Mike Frysinger <vapier.adi@gmail.com>, Russ Dill <russ.dill@gmail.com>,
	Jamie Lokier <jamie@shareable.org>, Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Rapoport <mike@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 12, 2008 at 11:35:30AM +0100, David Woodhouse wrote:
> On Sun, 2008-10-12 at 11:13 +0100, Russell King - ARM Linux wrote:
> > Consider the loudspeaker amplifier example.  Does it
> > matter if the amplifier is powered up for a few milliseconds on boot?
> > No.  
> 
> Sometimes it does. Partly because that usually means it's also powered
> up during wake from suspend -- so you get horrible clicks when resume.
> Which if you suspend as often as OLPC does, for example, is a pain.

As I've pointed out, it's hardware dependent.

If your hardware has "sleep modes" for GPIO which are preserved until
you explicitly release the GPIO hardware from sleep state - giving you
a chance to restore the GPIO registers on resume without the external
hardware seeing glitches - then you set the sleep mode state so the
GPIO for the amplifier is set as an output, and driven to the "powered
down" level.

On hardware which doesn't have that facility, then yes you do want
pull-ups and pull-downs.  But just because your hardware doesn't have
sensible GPIO hardware, that's no reason to outlaw setting GPIOs to
their inactive states while unloading drivers.
