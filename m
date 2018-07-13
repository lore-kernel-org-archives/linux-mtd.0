Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fe4yc-00047E-8u
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 20:47:44 +0000
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, y2038@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Deepa Dinamani <deepa.kernel@gmail.com>, Jan Kara <jack@suse.cz>,
 David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 1/2] [RESEND] jffs2: use 64-bit intermediate timestamps
Date: Fri, 13 Jul 2018 22:47:13 +0200
Message-ID: <2205649.NecG7tB80L@blindfold>
In-Reply-To: <20180713144739.3150217-1-arnd@arndb.de>
References: <20180713144739.3150217-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 13. Juli 2018, 16:47:16 CEST schrieb Arnd Bergmann:
> The VFS now uses timespec64 timestamps consistently, but jffs2 still
> converts them to 32-bit numbers on the storage medium. As the helper
> functions for the conversion (get_seconds() and timespec_to_timespec64())
> are now deprecated, let's change them over to the more modern
> replacements.
> 
> This keeps the traditional interpretation of those values, where
> the on-disk 32-bit numbers are taken to be negative numbers, i.e.
> dates before 1970, on 32-bit machines, but future numbers past 2038
> on 64-bit machines.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I originally sent these two patches on Jun 19, but got no reply aside
> from a harmless sparse warning reported by the kbuild test robot.
> 
> Looking at the git history for jffs2, it seems that David Woodhouse
> hasn't applied any patches for over two years, so I suppose he's
> not taking these either.
> 
> Al or Andrew, could you pick these up instead?

We can carry it also via the MTD tree.

Thanks,
//richard
