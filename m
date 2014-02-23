Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHhxL-0001yN-Ck
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 22:55:33 +0000
Received: by mail-pa0-f43.google.com with SMTP id rd3so5759758pab.30
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 14:55:09 -0800 (PST)
Date: Sun, 23 Feb 2014 14:55:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Albert ARIBAUD <albert.u.boot@aribaud.net>
Subject: Re: [U-Boot] [PATCH v3 1/3] mtd: nand: omap: fix ecclayout to be in
 sync with u-boot NAND driver
Message-ID: <20140223225505.GC16834@norris-Latitude-E6410>
References: <1392622885-8415-1-git-send-email-pekon@ti.com>
 <1392622885-8415-2-git-send-email-pekon@ti.com>
 <20140217101152.1fb2dd50@lilith>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140217101152.1fb2dd50@lilith>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Felipe Balbi <balbi@ti.com>,
 u-boot@lists.denx.de, Enric Balletbo Serra <eballetbo@iseebcn.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 stable@vger.kernel.org, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 17, 2014 at 10:11:52AM +0100, Albert ARIBAUD wrote:
> On Mon, 17 Feb 2014 13:11:23 +0530, Pekon Gupta <pekon@ti.com> wrote:
> > Fixes: commit a919e51161b58ed7e6e663daba99ab7d558808f3
> >        mtd: nand: omap2: clean-up BCHx_HW and BCHx_SW ECC configurations in device_probe
> > 
> > Fixes ecclayout mismatch introduced in above commit for following ecc-schemes:
> >  - OMAP_ECC_BCH4_CODE_HW_DETECTION_SW
> >  - OMAP_ECC_BCH8_CODE_HW_DETECTION_SW
> >  However, this patch also touches other ecc-schemes as the fix required
> >  refactoring common code, into ecc-scheme specific code.
> > 
> > This patch aligns ecc-layout for below ecc-schemes as per reference [1],[2],[3]
> >                 Figure="ECC Locations in NAND Spare Areas"
[snip]
> 
> Seems to me that the commit message above could actually be placed in
> a doc/README.* file, making the commit message itself less bulky.

Yes, I have suggested Pekon add this as a proper documentation file. But
I will take the patches as-is anyway.

Brian
