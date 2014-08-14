Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XI3nN-0004Ya-GQ
 for linux-mtd@lists.infradead.org; Thu, 14 Aug 2014 22:46:57 +0000
Received: by mail-pa0-f49.google.com with SMTP id hz1so2425410pad.22
 for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2014 15:46:35 -0700 (PDT)
Date: Thu, 14 Aug 2014 15:46:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH][resend] mtd: atmel_nand: make PMECC lookup table and
 offset property optional
Message-ID: <20140814224625.GF18411@ld-irv-0074>
References: <1407490110-16735-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407490110-16735-1-git-send-email-josh.wu@atmel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, galak@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 08, 2014 at 05:28:30PM +0800, Josh Wu wrote:
> If there is no PMECC lookup table stored in ROM, or lookup table offset is
> not specified, PMECC driver should build it in DDR by itself.
> 
> That make the PMECC driver work for some board which doesn't has PMECC
> lookup table in ROM.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Cc: devicetree@vger.kernel.org

drivers/mtd/nand/atmel_nand.c:1204:11: warning: no previous prototype for 'create_lookup_table' [-Wmissing-prototypes]

You probably should make create_lookup_table() static.

Brian
