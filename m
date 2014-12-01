Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvVcg-0000dh-1v
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 18:22:58 +0000
Received: by mail-pa0-f42.google.com with SMTP id et14so11637083pad.29
 for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2014 10:22:36 -0800 (PST)
Date: Mon, 1 Dec 2014 10:22:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: use IS_ERR_OR_NULL as spi_nor_read_id
 returns ERR_PTR
Message-ID: <20141201182232.GH21347@ld-irv-0074>
References: <1417430244-17924-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1417430244-17924-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 01, 2014 at 11:37:24AM +0100, Rafał Miłecki wrote:
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> Oh damn, I did wrong in my commit
> 5986a0d4717bc82af0e69e3c6dd04150eafceabe
> mtd: spi-nor: allow NULL as chip name and try to auto detect it
> 
> Glad we have Dan & kbuild watching us.

Squashed into the bad commit and pushed to l2-mtd.git. Thanks!
