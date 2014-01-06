Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W04qK-0002SW-GY
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 07:43:25 +0000
Message-ID: <52CA5E79.4090503@denx.de>
Date: Mon, 06 Jan 2014 08:42:49 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Pekon Gupta <pekon@ti.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v6 0/6] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
In-Reply-To: <1388803698-26252-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, balbi@ti.com,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.01.2014 03:48, Pekon Gupta wrote:
> *changes v5 -> v6*
> [PATCH 1/6] <no change>
> [PATCH 2/6] introduced variable 'actual_eccbytes' to omit reserved byte-position
> [PATCH 3/6] split from [PATCH v5 3/5] fix erased-page bit-flip correction
> [PATCH 4/6] split from [PATCH v5 3/5] fix erased-page detection
> [PATCH 5/6] <minor cleanup>
> [PATCH 6/6] <no change>

Thanks, Pekon. This fixes some problems we have seen on an AM335x board
with ECC errors on UBI/UBIFS mounting. So for the whole patch series:

Tested-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
