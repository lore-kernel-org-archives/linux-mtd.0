Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc1S2-0002hs-78
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 03:00:48 +0000
Received: by mail-pf0-x242.google.com with SMTP id b145so562737pfb.2
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 19:00:25 -0800 (PST)
Date: Thu, 9 Feb 2017 19:00:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] mtd: bcm47xxpart: move TRX parsing code to
 separated function
Message-ID: <20170210030022.GA65051@google.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170110221525.9216-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 10, 2017 at 11:15:24PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This change simplifies main parsing loop logic a bit. In future it may
> be useful for moving TRX support to separated module / parser (if we
> implement support for them at some point).
> Finally parsing TRX at the end puts us in a better position as we have
> better flash layout knowledge. It may be useful e.g. if it appears there
> is more than 1 TRX partition.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Keep using bcm47xxpart_add_part in new parsing function

Applied both to l2-mtd.git
