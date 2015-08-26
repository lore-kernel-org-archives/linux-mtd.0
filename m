Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUaOv-0001j6-Rd
 for linux-mtd@lists.infradead.org; Wed, 26 Aug 2015 13:06:02 +0000
From: Marek Vasut <marex@denx.de>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH] mtd: spi-nor: allow dual/quad reads on S25FL129P
Date: Wed, 26 Aug 2015 15:05:36 +0200
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
References: <1440593813-16360-1-git-send-email-jogo@openwrt.org>
In-Reply-To: <1440593813-16360-1-git-send-email-jogo@openwrt.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508261505.36546.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 26, 2015 at 02:56:53 PM, Jonas Gorski wrote:
> According to the datasheet[1], both S25FL129P0 (256kB sectors) and
> S25FL129P1 (64kB sectors) support dual read, quad read, dual i/o read
> and quad i/o read.
> 
> I have verified dual read to be working for S25FL129P1 on a dual
> capable spi controller. Quad as well as S25FL129P0 is untested, lacking
> hardware to verify.
> 
> [1] http://www.spansion.com/Support/Datasheets/S25FL129P_00.pdf
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

I don't have this device, so I cannot test, sorry. On the other hand,
spansion doesn't seem to put b/s in their datasheets, so I'd be happy
to add my:

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
