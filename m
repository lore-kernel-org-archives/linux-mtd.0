Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MWcFc-0005BZ-Qh
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 20:29:25 +0000
Date: Thu, 30 Jul 2009 22:29:13 +0200
From: Daniel Mack <daniel@caiaq.de>
To: E Robertson <e.robertson.svg@gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
Message-ID: <20090730202913.GB13236@buzzloop.caiaq.de>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 03:14:43PM -0500, E Robertson wrote:
> I got 2.6.31-rc4 and patch it which wasn't painful.
> However, no change.
> Here are the results: My initramfs initially mount the two nand
> partitions and that's where the initial
> uncorrectable error comes from.

Some thoughts.

Could you try running the torture test from drivers/mtd/tests? Which
platform is that? Are you sure you're running the NAND chip well inside
its timing specs? Does the flash access work from the bootloader?

I recently had similar trouble which disappeared after I switched off
CPU frequency scaling.

Daniel
