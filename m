Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aN6w2-0004vk-6N
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 22:45:34 +0000
Received: by mail-pa0-x236.google.com with SMTP id yy13so60173052pab.3
 for <linux-mtd@lists.infradead.org>; Sat, 23 Jan 2016 14:45:13 -0800 (PST)
Date: Sat, 23 Jan 2016 14:45:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] mtd: bcm47xxpart: limit scanned flash area on BCM47XX
 (MIPS) only
Message-ID: <20160123224509.GE24744@localhost>
References: <1449277783-7369-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1449277783-7369-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 05, 2015 at 02:09:43AM +0100, Rafał Miłecki wrote:
> We allowed using bcm47xxpart on BCM5301X arch with commit:
> 9e3afa5f5c7 ("mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X")
> 
> BCM5301X devices may contain some partitions in higher memory, e.g.
> Netgear R8000 has board_data at 0x2600000. To detect them we should
> use size limit on MIPS only.

Why was the siez limit imposed in the first place? Just to make the scan more
efficient?

> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git/next
