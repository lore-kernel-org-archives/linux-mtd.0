From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20041128225616.GG4390@stusta.de>
References: <20041128225616.GG4390@stusta.de>
Content-Type: text/plain
Date: Mon, 29 Nov 2004 23:04:15 +0000
Message-Id: <1101769455.6960.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] select for drivers/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-11-28 at 23:56 +0100, Adrian Bunk wrote:
> The patch below switches options to use select where appropriate.

Thanks. Applied to bk://linux-mtd.bkbits.net/mtd-2.6 to go in after
2.6.10

> One of the dependencies of MTD_GEN_PROBE was on MTD_INTELPROBE that
> isn't in Linus' tree. If this symbol is present in the mtd cvs, a
> similar select is needed there.

It's gone now; removing it was correct.

> What's the purpose of the MTD_DOCECC option, which has always the same 
> value as the MTD_DOCPROBE option?

It's obsolescent. The new DiskOnChip hardware driver was recently
converted from using it, in favour of the new Reed-Solomon library code.
Some day relatively soon the old hardware driver can go too, but not
yet. It's probably not worth converting that to the new ECC code.

-- 
dwmw2
