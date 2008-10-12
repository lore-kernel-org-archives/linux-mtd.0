Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kp2Uw-0003Xx-M1
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 15:04:47 +0000
Date: Sun, 12 Oct 2008 16:04:28 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081012150427.GB18814@shareable.org>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081012101326.GB29975@flint.arm.linux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Mike Frysinger <vapier.adi@gmail.com>, Russ Dill <russ.dill@gmail.com>,
	Ben Dooks <ben-linux-arm@fluff.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Mike Rapoport <mike@compulab.co.il>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russell King - ARM Linux wrote:
> So, while you see "lack of pull ups" as crappy design, others will see
> it as a power and cost saving measure.

That's a good point that probably only low-power designers are familiar
with.

If you have a GPIO feeding a CMOS input, and if you're counting the
microamps, be wary of them.

CMOS inputs use very little power indeed, and a pull up/down resistor
will use relatively much more.

On the other hand, pull ups/downs are often to disable a component if
software to drive the GPIO is not loaded, and that can save power too.
Sometimes they are needed.

It's good if the CPU boot software can set up GPIO defaults, and the
CPU (or other GPIO driver chip) maintains them when sleeping, and the
reset sequence can take the CPU out of hardware reset before all other
components, to prevent floating inputs to those components.

-- Jamie
