Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bl5sv-0004SJ-6S
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 09:02:49 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Amit Shah <amitshah@gmx.net>
In-Reply-To: <cd5p23$dfj$1@sea.gmane.org>
References: <cd5p23$dfj$1@sea.gmane.org>
Content-Type: text/plain
Message-Id: <1089896566.14567.1306.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 15 Jul 2004 14:02:46 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: PCI flash: found no device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-15 at 16:43 +0530, Amit Shah wrote:
> Hi all,
> 
> I've added support for flash memory for a PCI card in
> drivers/mtd/maps/pci.c, based on the two existing drivers. The flash type
> is Intel 28F series and supports CFI probes.

The message you saw means that we didn't recognise any flash chips. Are
you sure your 'bankwidth' was set correctly? What type and width of
flash chips? How many are interleaved?

-- 
dwmw2
