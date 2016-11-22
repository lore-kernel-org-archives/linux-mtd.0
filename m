Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9H0y-0006vO-28
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2016 19:46:01 +0000
Received: by mail-pg0-x242.google.com with SMTP id 3so2908871pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2016 11:45:39 -0800 (PST)
Date: Tue, 22 Nov 2016 11:45:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: bcm47xxpart: fix parsing first block after aligned
 TRX
Message-ID: <20161122194536.GH77253@google.com>
References: <20161120150930.25401-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20161120150930.25401-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 20, 2016 at 04:09:30PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> After parsing TRX we should skip to the first block placed behind it.
> Our code was working only with TRX with length not aligned to the
> blocksize. In other cases (length aligned) it was missing the block
> places right after TRX.
> 
> This fixes calculation and simplifies the comment.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied to l2-mtd.git
