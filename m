Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kp6PD-0002wj-5k
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 19:15:07 +0000
Date: Sun, 12 Oct 2008 20:09:40 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
Message-ID: <20081012190939.GA28525@flint.arm.linux.org.uk>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
	<8bd0f97a0810121204t115a7b95o33fb06a2fd13273d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bd0f97a0810121204t115a7b95o33fb06a2fd13273d@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Russ Dill <russ.dill@gmail.com>, Jamie Lokier <jamie@shareable.org>,
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

On Sun, Oct 12, 2008 at 03:04:06PM -0400, Mike Frysinger wrote:
> On Sun, Oct 12, 2008 at 06:13, Russell King - ARM Linux wrote:
> > It doesn't.  The fact that the GPIO state is preserved when free'd on
> > PXA is just that it takes _more_ code to do anything else.
> 
> so which is it ?  GPIO state *should* be preserved, or PXA does it
> simply due to code frugality ?

May I remind you that _you_ are the one with the system which doesn't
preserve GPIO state.

> if the API behavior is strictly documented, your complaint here is
> pretty moot.

My complaint?  I don't have a complaint.  You are the one with the
complaint with the driver that's being discussed.  You're the one
who's moaning about it setting state before calling gpio_free.

I see no point in continuing this discussion; your arguments are
just plain silly.  I've explained _why_ we're doing it.

Our GPIO hardware behaves differently from yours.  Our gpio_free()
is side-effect free.  Get over it.
