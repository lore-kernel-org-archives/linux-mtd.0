Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uao7K-0007KE-2m
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:16:15 +0000
Message-ID: <1368195520.26780.169.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in
 m25p80.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Fri, 10 May 2013 17:18:40 +0300
In-Reply-To: <515D4AA7.9080307@wanadoo.fr>
References: <515D4AA7.9080307@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2013-04-04 at 11:40 +0200, Michel Stempin wrote:
> Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.chingistek.com/img/Product_Files/Pm25LQ032C%20datasheet%20v1.6.1.pdf) SPI Flash chips, used in various WiFi pocket routers.
> 
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>

Would you please rebase against the latest kernel and re-send. Please,
pay attention to this patch which is already in upstream:

commit e534ee4f9ca29fdb38eea4b0c53f2154fbd8c1ee
Author: Krzysztof Mazur <krzysiek@podlesie.net>
Date:   Fri Feb 22 15:51:05 2013 +0100

    mtd: m25p80: introduce SST_WRITE flag for SST byte programming
    
    Not all SST devices implement the SST byte programming command.
    Some devices (like SST25VF064C) implement only standard m25p80 page
    write command.
    
    Now SPI flash devices that need sst_write() are explicitly marked
    with new SST_WRITE flag and the decision to use sst_write() is based
    on this flag instead of manufacturer id.
    
    Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
Best Regards,
Artem Bityutskiy
