Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tzupp-0008Cw-04
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 19:57:41 +0000
Message-ID: <5106D82A.8080507@hauke-m.de>
Date: Mon, 28 Jan 2013 20:57:30 +0100
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2 4/6] mtd: bcm47xxnflash: register this as normal driver
References: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
 <1359368750-19763-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1359368750-19763-4-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/28/2013 11:25 AM, Rafał Miłecki wrote:
> From: Hauke Mehrtens <hauke@hauke-m.de>
> 
> When platform_driver_probe() is used and no device is registered for
> this driver -ENODEV is returned and and error message is shown. Not all
> BCM47xx SoC have a nand flash chip controller and chip and for them an
> error message was shown.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
> V2: rebase after change in V2 of 3/6

Thanks Rafał for taking this up.

Hauke
