Received: from mail-pf0-f196.google.com ([209.85.192.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbXpa-00019k-Gc
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 19:23:08 +0000
Received: by mail-pf0-f196.google.com with SMTP id 19so12253962pfo.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 11:22:45 -0800 (PST)
Date: Wed, 8 Feb 2017 11:21:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Kalle Valo <kvalo@codeaurora.org>, linux-mtd@lists.infradead.org,
 linux-wireless@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: use platform_(set|get)_drvdata
Message-ID: <20170208192142.GA94627@google.com>
References: <20170116162818.12094-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170116162818.12094-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 16, 2017 at 05:28:18PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> We have generic place & helpers for storing platform driver data so
> there is no reason for using custom priv pointer.
> 
> This allows cleaning up struct bcma_sflash from unneeded fields.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> Kalle: This is mtd focused patch, so I guess it should go through mtd tree. Do
>        you find bcma change important enough to care to Ack it? :)

Applied to l2-mtd.git.
