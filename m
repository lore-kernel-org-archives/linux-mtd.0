Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm9KC-0002qp-3b
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 22:45:12 +0000
Received: by mail-pd0-f176.google.com with SMTP id ft15so1630526pdb.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 14:44:51 -0800 (PST)
Date: Wed, 5 Nov 2014 14:44:47 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v3] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Message-ID: <20141105224447.GY23619@ld-irv-0074>
References: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413021710-32264-1-git-send-email-josh.wu@atmel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, nicolas.ferre@atmel.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, voice.shen@atmel.com, galak@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 11, 2014 at 06:01:50PM +0800, Josh Wu wrote:
> From: Josh Wu <Josh.wu@atmel.com>
> 
> If there is no PMECC lookup table stored in ROM, or lookup table offset is
> not specified, PMECC driver should build it in DDR by itself.
> 
> That make the PMECC driver work for some board which doesn't has PMECC
> lookup table in ROM.
> 
> The PMECC use the BCH algorithm, so based on the build_gf_tables()
> function in lib/bch.c, we can build the Galois Field lookup table.
> 
> For more information can refer to section 5.4 of PMECC controller
> application note:
> 	http://www.atmel.com/images/doc11127.pdf
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Cc: devicetree@vger.kernel.org

Applied to l2-mtd.git.

Brian
