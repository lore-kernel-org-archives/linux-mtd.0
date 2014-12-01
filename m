Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvMkJ-00060N-GQ
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 08:54:16 +0000
Received: by mail-pa0-f45.google.com with SMTP id lj1so10641237pab.18
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 00:53:54 -0800 (PST)
Date: Mon, 1 Dec 2014 00:53:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
Message-ID: <20141201085351.GJ29070@brian-ubuntu>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
 <1417423336-15255-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417423336-15255-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 01, 2014 at 09:42:16AM +0100, Rafał Miłecki wrote:
> This will allow spi-nor users to plainly use JEDEC to detect flash chip.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: Rebase on top of:
> 6d7604e mtd: spi-nor: add support for s25fl128s
> d928a25 mtd: spi-nor: remove the jedec_id/ext_id
> 09ffafb mtd: spi-nor: add id/id_len for flash_info{}

Applied, thanks!

Brian
