Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cQsP6-00024v-UE
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 09:07:43 +0000
Date: Tue, 10 Jan 2017 10:07:07 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Icenowy Zheng <icenowy@aosc.xyz>,
 Valdis.Kletnieks@vt.edu, Aleksei Mamlin <mamlinav@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, kbuild-all@01.org
Subject: Re: [PATCH v6 16/17] mtd: nand: hynix: Rework NAND ID decoding to
 extract more information
Message-ID: <20170110100707.4f85ad8e@bbrezillon>
In-Reply-To: <alpine.DEB.2.20.1701092120120.2029@hadrien>
References: <alpine.DEB.2.20.1701092120120.2029@hadrien>
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

Hi Julia,

On Mon, 9 Jan 2017 21:21:27 +0100 (CET)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> It looks odd that lines 158 and 160 are the same.

Indeed, it should be 'chip->ecc_step_ds = 1024;' in the else branch.
I'll fix that.

Thanks,

Boris

> 
> julia
> 
> ---------- Forwarded message ----------
> 
> In-Reply-To: <1483956264-3335-17-git-send-email-boris.brezillon@free-electrons.com>
> 
> Hi Boris,
> 
> [auto build test WARNING on mtd/master]
> [also build test WARNING on v4.10-rc3 next-20170106]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Boris-Brezillon/mtd-nand-allow-vendor-specific-detection-initialization/20170110-022221
> base:   git://git.infradead.org/linux-mtd.git master
> :::::: branch date: 2 hours ago
> :::::: commit date: 2 hours ago
> 
> >> drivers/mtd/nand/nand_hynix.c:157:4-6: WARNING: possible condition with no effect (if == else)  
> 
> git remote add linux-review https://github.com/0day-ci/linux
> git remote update linux-review
> git checkout ee58e9ecc231f4a40ff46fe95078d7796ebe430b
> vim +157 drivers/mtd/nand/nand_hynix.c
> 
> ee58e9ec Boris Brezillon 2017-01-09  141  			 */
> ee58e9ec Boris Brezillon 2017-01-09  142  			WARN(1, "Invalid ECC requirements");
> 1065fa22 Boris Brezillon 2017-01-09  143  		}
> ee58e9ec Boris Brezillon 2017-01-09  144  	} else {
> ee58e9ec Boris Brezillon 2017-01-09  145  		/*
> ee58e9ec Boris Brezillon 2017-01-09  146  		 * The ECC requirements field meaning depends on the
> ee58e9ec Boris Brezillon 2017-01-09  147  		 * NAND technology.
> ee58e9ec Boris Brezillon 2017-01-09  148  		 */
> ee58e9ec Boris Brezillon 2017-01-09  149  		u8 nand_tech = chip->id.data[5] & 0x3;
> 1065fa22 Boris Brezillon 2017-01-09  150
> ee58e9ec Boris Brezillon 2017-01-09  151  		if (nand_tech < 3) {
> ee58e9ec Boris Brezillon 2017-01-09  152  			/* > 26nm, reference: H27UBG8T2A datasheet */
> ee58e9ec Boris Brezillon 2017-01-09  153  			if (ecc_level < 5) {
> ee58e9ec Boris Brezillon 2017-01-09  154  				chip->ecc_step_ds = 512;
> ee58e9ec Boris Brezillon 2017-01-09  155  				chip->ecc_strength_ds = 1 << ecc_level;
> ee58e9ec Boris Brezillon 2017-01-09  156  			} else if (ecc_level < 7) {
> ee58e9ec Boris Brezillon 2017-01-09 @157  				if (ecc_level == 5)
> ee58e9ec Boris Brezillon 2017-01-09  158  					chip->ecc_step_ds = 2048;
> 1065fa22 Boris Brezillon 2017-01-09  159  				else
> ee58e9ec Boris Brezillon 2017-01-09  160  					chip->ecc_step_ds = 2048;
> ee58e9ec Boris Brezillon 2017-01-09  161  				chip->ecc_strength_ds = 24;
> ee58e9ec Boris Brezillon 2017-01-09  162  			} else {
> ee58e9ec Boris Brezillon 2017-01-09  163  				/*
> ee58e9ec Boris Brezillon 2017-01-09  164  				 * We should never reach this case, but if that
> ee58e9ec Boris Brezillon 2017-01-09  165  				 * happens, this probably means Hynix decided
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
