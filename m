From: David Woodhouse <dwmw2@infradead.org>
To: Wolfgang =?ISO-8859-1?Q?M=FCes?= <wolfgang.mues@auerswald.de>
In-Reply-To: <200603201622.08947.wolfgang.mues@auerswald.de>
References: <1142865089.c65a3380tomas2003@home.se>
	<200603201622.08947.wolfgang.mues@auerswald.de>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Mar 2006 15:26:55 +0000
Message-Id: <1142868415.4389.20.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-03-20 at 16:22 +0100, Wolfgang Mües wrote:
> Am Montag, 20. März 2006 16:12 schrieb Tomas E:
> > I have a problem with writing to a Intel Strata flash
> > and then doing a warm reset.

Define 'warm reset'. Why isn't the reset line to the flash being
asserted?

> Hmmm... seems to be the status register?

Yes, that's expected.

> Is there a function in the mtd subsystem that misses a read array
> command at the end of a flash function?

No. You'd still be able to break it by resetting at the wrong time, and
by having a half-arsed hack to stick it back in read mode at the end of
each operation, you'd only _hide_ that problem. It's better for people
to notice their error and fix up their reset sequence properly.

-- 
dwmw2
