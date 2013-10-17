Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWd7f-0006QV-0N
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 02:15:35 +0000
Received: by mail-ie0-f178.google.com with SMTP id to1so3851287ieb.9
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2013 19:15:14 -0700 (PDT)
Date: Wed, 16 Oct 2013 19:06:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 6/9] mtd: nand: omap: clean-up ecc layout for BCH
 ecc schemes
Message-ID: <20131017020658.GB23337@ld-irv-0074.broadcom.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-7-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381816197-20477-7-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com, balbi@ti.com,
 robherring2@gmail.com, bcousson@baylibre.com, swarren@wwwdotorg.org,
 olof@lixom.net, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 15, 2013 at 11:19:54AM +0530, Pekon Gupta wrote:
> In current implementation omap3_init_bch_tail() is a common function to
> define ecc layout for different BCHx ecc schemes.This patch:
> (1) removes omap3_init_bch_tail() and defines ecc layout for individual
>     ecc-schemes along with populating their nand_chip->ecc data in
>     omap_nand_probe(). This improves the readability and scalability of
>     code for add new ecc schemes in future.
> (2) removes 'struct nand_bbt_descr bb_descrip_flashbased' because default
>     nand_bbt_descr in nand_bbt.c matches the same (.len=1 for x8 devices).
> (3) add the check to see if NAND device has enough OOB/Spare bytes to
>     store ECC signature of whole page, as defined by ecc-scheme.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>

This patch also looks OK.

Brian
