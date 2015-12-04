Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4zy1-0005r8-U8
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:40:46 +0000
Received: by pacej9 with SMTP id ej9so93908281pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:40:25 -0800 (PST)
Date: Fri, 4 Dec 2015 15:40:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: spi-nor: fix error handling in spi_nor_erase
Message-ID: <20151204234022.GI120110@google.com>
References: <564B7D9E.4070901@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564B7D9E.4070901@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 08:18:54PM +0100, Heiner Kallweit wrote:
> The documenting comment of mtd_erase in mtdcore.c states:
> Device drivers are supposed to call instr->callback() whenever
> the operation completes, even if it completes with a failure.
> 
> Currently the callback isn't called in case of failure. Fix this.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied patch 3 to l2-mtd.git. Thanks!
