Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LojH0-0004xO-Nx
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 19:05:32 +0000
Date: Tue, 31 Mar 2009 23:05:17 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH v4 1/4] NAND: FSL-UPM: add multi chip support
Message-ID: <20090331190517.GA23767@oksana.dev.rtsoft.ru>
References: <20090330100241.346785618@denx.de>
	<20090330100554.947307803@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20090330100554.947307803@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 30, 2009 at 12:02:42PM +0200, Wolfgang Grandegger wrote:
> This patch adds support for multi-chip NAND devices to the FSL-UPM
> driver. This requires support for multiple GPIOs for the RNB pins.
> The NAND chips are selected through address lines defined by the
> FDT property "fsl,upm-addr-line-cs-offsets".
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Anton Vorontsov <avorontsov@ru.mvista.com>
