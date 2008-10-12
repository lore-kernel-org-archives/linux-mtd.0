Subject: Re: [PATCH] [MTD] [NAND] GPIO NAND flash driver
From: David Woodhouse <dwmw2@infradead.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
In-Reply-To: <20081012101326.GB29975@flint.arm.linux.org.uk>
References: <48EF3291.5040000@compulab.co.il>
	<20081010141916.GB16934@shareable.org>
	<20081010214827.GP435@flint.arm.linux.org.uk>
	<8bd0f97a0810101507y589dfd3br4da47c634e83bb36@mail.gmail.com>
	<48F1AF0C.8080401@compulab.co.il>
	<8bd0f97a0810120114p261e86bbib791eedfe0808ed8@mail.gmail.com>
	<20081012082803.GA29975@flint.arm.linux.org.uk>
	<8bd0f97a0810120156t4905c5f4t312197930febabc4@mail.gmail.com>
	<20081012101326.GB29975@flint.arm.linux.org.uk>
Content-Type: text/plain
Date: Sun, 12 Oct 2008 11:35:30 +0100
Message-Id: <1223807730.6770.387.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Sun, 2008-10-12 at 11:13 +0100, Russell King - ARM Linux wrote:
> Consider the loudspeaker amplifier example.  Does it
> matter if the amplifier is powered up for a few milliseconds on boot?
> No.  

Sometimes it does. Partly because that usually means it's also powered
up during wake from suspend -- so you get horrible clicks when resume.
Which if you suspend as often as OLPC does, for example, is a pain.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
