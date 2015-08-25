Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUL4H-0007Xb-MK
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 20:43:43 +0000
Received: by pabzx8 with SMTP id zx8so44392514pab.1
 for <linux-mtd@lists.infradead.org>; Tue, 25 Aug 2015 13:43:20 -0700 (PDT)
Date: Tue, 25 Aug 2015 13:43:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: spi-nor: stop (ab)using struct spi_device_id
Message-ID: <20150825204318.GN81844@google.com>
References: <1439235543-2893-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1439235543-2893-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 10, 2015 at 09:39:03PM +0200, Rafał Miłecki wrote:
> Using struct spi_device_id for storing list of flash devices comes from
> early SPI NOR framework days. Thanks to the commit 70f3ce0510af ("mtd:
> spi-nor: make spi_nor_scan() take a chip type name, not spi_device_id")
> we can stop using spi_device_id and just switch to our own struct.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Excellent, thanks! Pushed to l2-mtd.git.
