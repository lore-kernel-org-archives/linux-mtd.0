Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czWEk-0003aY-B9
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 22:32:12 +0000
Date: Sun, 16 Apr 2017 00:31:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rafa?? Mi??ecki <zajec5@gmail.com>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3] mtd: mchp23k256: Add driver for this SPI SRAM device
Message-ID: <20170415223142.GA11192@lunn.ch>
References: <1491946212-9226-1-git-send-email-andrew@lunn.ch>
 <03445c64-a4b4-6130-e389-b4c8eb8b4e63@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03445c64-a4b4-6130-e389-b4c8eb8b4e63@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 16, 2017 at 12:26:31AM +0200, Rafa?? Mi??ecki wrote:
> On 04/11/2017 11:30 PM, Andrew Lunn wrote:
> >+MODULE_DESCRIPTION("MTD SPI driver for MCHP23K256 RAM chips");
> >+MODULE_AUTHOR("Andrew Lunn <andre@lunn.ch>");
> >+MODULE_LICENSE("GPL");
> >+MODULE_ALIAS("spi:mchp23k256");
> 
> You got correct MODULE_LICENSE in V2 and it's back wrong in V3.

And fixed again in v4

https://patchwork.ozlabs.org/patch/750053/

	Andrew
