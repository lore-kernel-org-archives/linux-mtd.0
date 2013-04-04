Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UNlsM-0003rN-GW
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2013 15:14:55 +0000
Message-ID: <1365088578.626.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: subpage write support for hardware based ECC
 schemes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Thu, 04 Apr 2013 18:16:18 +0300
In-Reply-To: <1363352378-2825-1-git-send-email-pekon@ti.com>
References: <1363352378-2825-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-15 at 18:29 +0530, Gupta, Pekon wrote:
>  	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> -			const uint8_t *buf, int oob_required, int page,
> -			int cached, int raw);
> +			uint32_t offset, int data_len, const uint8_t *buf,
> +			int oob_required, int page, int cached, int raw);

You need to update cafe_nand.c accordingly. Aiaiai detected this:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/cafe_nand.c: In function ‘cafe_nand_probe’:
+drivers/mtd/nand/cafe_nand.c:787:24: warning: assignment from
incompatible pointer type [enabled by default]

-- 
Best Regards,
Artem Bityutskiy
