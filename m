Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a76K4-0008Au-Vo
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 18:52:15 +0000
Subject: Re: [PATCH linux-next] mtd: part: Add BCM962368 CFE partitioning
 support
To: Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <5668A33E.4040405@simon.arlott.org.uk> <5669B965.5030105@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <5669C9B9.1070103@simon.arlott.org.uk>
Date: Thu, 10 Dec 2015 18:51:37 +0000
MIME-Version: 1.0
In-Reply-To: <5669B965.5030105@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/12/15 17:41, Florian Fainelli wrote:
> Le 09/12/2015 13:55, Simon Arlott a écrit :
>>  drivers/mtd/Kconfig         |  21 +++
>>  drivers/mtd/Makefile        |   1 +
>>  drivers/mtd/bcm963268part.c | 373 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 395 insertions(+)
>>  create mode 100644 drivers/mtd/bcm963268part.c
> 
> What motivated created a separate partition parser rather then using the
> extended the existing one?

I started off doing that but had to split it up because how it handles
the nvram and bcm_tag to construct the partition layout is significantly
different. The nvram isn't even read from flash in bcm63xxpart, and the
psi size value isn't used by bcm963268.

> I would imagine that, at some point, the partition parser could know
> what kind of flash it needs to parse: SPI/P-NOR or NAND, and based on
> that, do an appropriate definition?

With the device tree changes Brian's introducing it can be specified in
there, otherwise a common parser would need to read from the
miscStrapBus register which would be difficult for a partition parser as
it's not a device and has no memory resources.

-- 
Simon Arlott
