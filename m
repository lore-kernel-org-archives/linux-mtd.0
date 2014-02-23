Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHXHl-00088K-JN
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 11:31:54 +0000
Message-ID: <5309DBF4.50305@hauke-m.de>
Date: Sun, 23 Feb 2014 12:31:00 +0100
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [RFC 0/3] mtd: bcm47xxnflash: adding support for new NANDs
References: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/23/2014 12:26 PM, Rafał Miłecki wrote:
> New Broadcom SoCs have NAND flashes attached & programmed in a totally different
> way. Instead of accessing them with help of ChipCommon core, they can be used
> directly.
> 
> To support them we can extend bcm47xxnflash in the way this patches implements.
> However almost nothing in the code will be shared between support for old and
> new devices.
> 
> How should we proceed? Implement it that way anyway? Or maybe writing a
> separated driver (bcm53xxnflash?) would be a better idea?
> 
Hi,

if this controller is completely different I would suggest writing a new
driver for that controller. Extending the existing driver would make if
just more complex.

Hauke
