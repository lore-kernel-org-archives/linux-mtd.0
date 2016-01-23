Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN6wG-0004xf-4U
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:45:48 +0000
Received: by mail-pa0-x232.google.com with SMTP id yy13so60174715pab.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:45:27 -0800 (PST)
Date: Sat, 23 Jan 2016 14:45:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: bcm47xxpart: don't fail because of bit-flips
Message-ID: <20160123224524.GF24744@localhost>
References: <1449397898-28703-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1449397898-28703-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 06, 2015 at 11:31:38AM +0100, Rafał Miłecki wrote:
> Bit-flip errors may occur on NAND flashes and are harmless. Handle them
> gracefully as read content is still reliable and can be parsed.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git/next
