Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3qF4-0004LY-5I
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 19:05:35 +0000
Received: by pabfh17 with SMTP id fh17so14212467pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 11:05:13 -0800 (PST)
Date: Tue, 1 Dec 2015 11:05:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: fix ONFI parameter page layout
Message-ID: <20151201190510.GY64635@google.com>
References: <1448274187-22174-1-git-send-email-boris.brezillon@free-electrons.com>
 <20151130201729.GK64635@google.com>
 <20151201103318.16a2e46a@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151201103318.16a2e46a@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 01, 2015 at 10:33:18AM +0100, Boris Brezillon wrote:
> On Mon, 30 Nov 2015 12:17:29 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Nov 23, 2015 at 11:23:07AM +0100, Boris Brezillon wrote:
> > > src_ssync_features field is only 1 byte large, and the 4th reserved area
> > > is actually 8 bytes large.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > Fixes d1e1f4e42b5 ("mtd: nand: add support for reading ONFI parameters from NAND device")
> > > Cc: <stable@vger.kernel.org> #v2.6.37+
> > 
> > Did you see an actual problem from this? (And is this deserving of
> > stable?) I could imagine an out-of-tree driver might try to use t_ald
> > (which should actually be t_adl, right?)
> 
> Yes, should be t_adl, not t_ald. Do you want me to send another patch
> for that, or will you take care of it?

I'll send a quick patch.

> > and get the wrong value. But no
> > one does that in-tree yet.
> 
> Fair enough, we can just drop the stable and fixes tag. Do you want me
> to resend it?

I presume this means you didn't see any actual problems caused by this
patch, other than new development referencing it?

Applied without the stable tag. I kept the fixes tag.

Thanks,
Brian
