From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3u12g8471.fsf@maxwell.lnxi.com>
References: <20040128034734.77883.qmail@web20725.mail.yahoo.com>
	 <m3u12g8471.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1075305569.1633.178.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 28 Jan 2004 15:59:30 +0000
Content-Transfer-Encoding: 7bit
cc: Shawn Jin <shawnxtech@yahoo.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: 64 bit bus access on a customed MPC8245 board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-01-28 at 08:48 -0700, Eric W. Biederman wrote:
> Shawn Jin <shawnxtech@yahoo.com> writes:
> > I'm working on a customed MPC8245 board with flash
> > chip Am29LV320 and trying to enable MTD driver
> > support.

> I looked and I can't find documentation for that chip.
> Is it an atmel one?

http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/26518.pdf

It's 16-bit, CFI-compliant, and (obviously) AMD command set.

> > The configuration is 32 bit bus width in each chip
> > with 2 chips interleaved. So CONFIG_MTD_CFI_B8 and
> > CONFIG_MTD_CFI_I2 are defined.

Not possible. Refer back to your documentation. The chip is not capable
of 32-bit operation. You probably mean 16*2, which means you want to
enable CFI_B4 and CFI_I2. But it would be better just to turn off the
advanced options and let it work it out for itself.

> Ok so you have configured it for 2 8bit chips that are
> interleaved to form a 16bit path.

B8 is 8-byte, not 8-bit. It's buswidth. He configured it to 2 32-bit
chips in a 64-bit path, which isn't correct.

-- 
dwmw2
