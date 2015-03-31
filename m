Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yckhv-0008CY-Ac
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 01:11:08 +0000
Received: by patj18 with SMTP id j18so2913900pat.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 18:10:46 -0700 (PDT)
Date: Mon, 30 Mar 2015 18:10:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH] spi: fsl-quadspi: cleanup wait_for_completion return
 handling
Message-ID: <20150331011041.GN32500@ld-irv-0074>
References: <1422789346-16954-1-git-send-email-hofrat@osadl.org>
 <CA+EcR23aNNaOEk8kmw7S1MX1uzVdZ=At1q2aAtJh3jNLnyOk7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcR23aNNaOEk8kmw7S1MX1uzVdZ=At1q2aAtJh3jNLnyOk7Q@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Marek Vasut <marex@denx.de>,
 Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Allen Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicholas Mc Guire <hofrat@osadl.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 10, 2015 at 10:00:01PM -0600, Han Xu wrote:
> On Sun, Feb 1, 2015 at 5:15 AM, Nicholas Mc Guire <hofrat@osadl.org> wrote:
> > return type of wait_for_completion_timeout is unsigned long not int, this
> > patch uses the return value of wait_for_completion_timeout in the condition
> > directly rather than adding a additional appropriately typed variable.
> >
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > ---
> >
> > As the returnvalue of wait_for_completion_timeout is logically treated here
> > as a boolean (timeout occured or not) it can be wrapped into the if condition
> > directly and no additional variable is needed.
> >
> > This patch was only compile tested with imx_v6_v7_defconfig
> > (implies CONFIG_SPI_FSL_QUADSPI=y)
> >
> > Patch is against 3.19.0-rc6 -next-20150130

In practice, I don't think this should matter, since we're not even
close to 2^32 jiffies, but the patch looks fine anyway.

Pushed to l2-mtd.git. Thanks!

Brian
