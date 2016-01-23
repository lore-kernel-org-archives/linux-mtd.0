Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN77H-0000xw-Jv
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:57:12 +0000
Received: by mail-pf0-x22a.google.com with SMTP id n128so61256552pfn.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:56:51 -0800 (PST)
Date: Sat, 23 Jan 2016 14:56:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <b45815@freescale.com>
Cc: shijie.huang@arm.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v8 4/7] mtd: nand: gpmi: may use minimum required ecc for
 744 oobsize NAND
Message-ID: <20160123225646.GH24744@localhost>
References: <1449096466-18064-1-git-send-email-b45815@freescale.com>
 <1449096466-18064-5-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449096466-18064-5-git-send-email-b45815@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 04:47:43PM -0600, Han Xu wrote:
> By default NAND driver will choose the highest ecc strength that oob
> could contain, in this case, for some 8K+744 NAND flash, the ecc
> strength will be up to 52bit, which beyonds the i.MX6QDL BCH capability
> (40bit).
> 
> This patch allows the NAND driver try to use minimum required ecc
> strength if it failed to use the highest ecc, even without explicitly
> claiming "fsl,use-minimum-ecc" in dts.
> 
> Signed-off-by: Han Xu <b45815@freescale.com>

Pushed this one to l2-mtd.git/next too.

Would it help to implement support for the "nand-ecc-step-size" and
"nand-ecc-strength" properties sometime? That would be more
maintainable, as it's more specific. What if you need a little stronger
than the minimum ECC? You also are relying on not changing the default
behavior of the driver, for the "legacy" ECC calculation still. That
ties your hands a bit.

Brian
