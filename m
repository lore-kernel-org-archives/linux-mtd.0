Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpGQ-0002iY-9V
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:32:14 +0000
Received: by mail-pa0-f43.google.com with SMTP id bj1so3813696pad.30
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:31:52 -0800 (PST)
Date: Thu, 6 Mar 2014 23:31:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47xxpart: allow enabling on ARCH_BCM_5301X
Message-ID: <20140307073150.GB31517@norris-Latitude-E6410>
References: <1393422939-25360-1-git-send-email-zajec5@gmail.com>
 <1393606921-9488-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393606921-9488-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 28, 2014 at 06:02:01PM +0100, Rafał Miłecki wrote:
> Home routers based on SoCs like BCM53010 (AKA BCM4708) use flashes
> which can be nicely partitioned with bcm47xxpart. Header bcm47xx_nvram.h
> is not available on bcm53xx, so don't include it.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
