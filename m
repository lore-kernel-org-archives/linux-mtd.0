Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffW44-000885-6E
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 19:55:17 +0000
Date: Tue, 17 Jul 2018 21:54:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>,
 y2038@lists.linaro.org, linux-kernel@vger.kernel.org, David Howells
 <dhowells@redhat.com>, linux-mtd@lists.infradead.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, David Woodhouse <dwmw2@infradead.org>, Deepa
 Dinamani <deepa.kernel@gmail.com>
Subject: Re: [PATCH 1/2] [RESEND] jffs2: use 64-bit intermediate timestamps
Message-ID: <20180717215453.04509003@bbrezillon>
In-Reply-To: <2205649.NecG7tB80L@blindfold>
References: <20180713144739.3150217-1-arnd@arndb.de>
 <2205649.NecG7tB80L@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 13 Jul 2018 22:47:13 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am Freitag, 13. Juli 2018, 16:47:16 CEST schrieb Arnd Bergmann:
> > The VFS now uses timespec64 timestamps consistently, but jffs2 still
> > converts them to 32-bit numbers on the storage medium. As the helper
> > functions for the conversion (get_seconds() and timespec_to_timespec64())
> > are now deprecated, let's change them over to the more modern
> > replacements.
> > 
> > This keeps the traditional interpretation of those values, where
> > the on-disk 32-bit numbers are taken to be negative numbers, i.e.
> > dates before 1970, on 32-bit machines, but future numbers past 2038
> > on 64-bit machines.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I originally sent these two patches on Jun 19, but got no reply aside
> > from a harmless sparse warning reported by the kbuild test robot.
> > 
> > Looking at the git history for jffs2, it seems that David Woodhouse
> > hasn't applied any patches for over two years, so I suppose he's
> > not taking these either.
> > 
> > Al or Andrew, could you pick these up instead?  
> 
> We can carry it also via the MTD tree.

I'll queue them to mtd/next.

Thanks,

Boris
