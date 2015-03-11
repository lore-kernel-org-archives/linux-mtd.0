Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVp33-0007Dh-8T
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 22:24:18 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Date: Wed, 11 Mar 2015 23:22:46 +0100
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201503112322.46491.marex@denx.de>
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, March 11, 2015 at 10:57:25 PM, Brian Norris wrote:
> Almost all flash that are "compatible" with m25p80 support the JEDEC
> READ ID opcode (0x95)

On the 2/2 patch, you claim READ ID is 0x9F . You might want to sort
this inconsistency :) Otherwise ...

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
