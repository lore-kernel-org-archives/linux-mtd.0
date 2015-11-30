Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3UfM-0003HH-2I
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 20:03:16 +0000
Received: by pacej9 with SMTP id ej9so194702881pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 12:02:55 -0800 (PST)
Date: Mon, 30 Nov 2015 12:02:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: include mtd.h header for struct mtd_info
 definition
Message-ID: <20151130200253.GJ64635@google.com>
References: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1448525104-20101-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 26, 2015 at 09:05:04AM +0100, Rafał Miłecki wrote:
> So far struct spi_nor was using just a pointer to struct mtd_info so it
> wasn't needed to have it fully defined there. After recent change we
> embed whole struct so we need to include a proper header.
> 
> Fixes: 1976367173a4 ("mtd: spi-nor: embed struct mtd_info within struct spi_nor")
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied to l2-mtd.git
