Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czW9g-0001rb-Kh
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 22:26:58 +0000
Received: by mail-lf0-x230.google.com with SMTP id c80so2792661lfh.3
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 15:26:35 -0700 (PDT)
Subject: Re: [PATCH v3] mtd: mchp23k256: Add driver for this SPI SRAM device
To: Andrew Lunn <andrew@lunn.ch>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
References: <1491946212-9226-1-git-send-email-andrew@lunn.ch>
Cc: linux-mtd@lists.infradead.org
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <03445c64-a4b4-6130-e389-b4c8eb8b4e63@gmail.com>
Date: Sun, 16 Apr 2017 00:26:31 +0200
MIME-Version: 1.0
In-Reply-To: <1491946212-9226-1-git-send-email-andrew@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/11/2017 11:30 PM, Andrew Lunn wrote:
> +MODULE_DESCRIPTION("MTD SPI driver for MCHP23K256 RAM chips");
> +MODULE_AUTHOR("Andrew Lunn <andre@lunn.ch>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("spi:mchp23k256");

You got correct MODULE_LICENSE in V2 and it's back wrong in V3.
