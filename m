Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LojHL-0005QL-5B
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 19:05:50 +0000
Date: Tue, 31 Mar 2009 23:05:42 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH v4 2/4] NAND: FSL-UPM: Add wait flags to support
	board/chip specific delays
Message-ID: <20090331190542.GB23767@oksana.dev.rtsoft.ru>
References: <20090330100241.346785618@denx.de>
	<20090330100555.111388782@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <20090330100555.111388782@denx.de>
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

On Mon, Mar 30, 2009 at 12:02:43PM +0200, Wolfgang Grandegger wrote:
> The NAND flash on the TQM8548_BE modules requires a short delay after
> running the UPM pattern. The TQM8548_BE requires a further short delay
> after writing out a buffer. Normally the R/B pin should be checked, but
> it's not connected on the TQM8548_BE. The existing driver uses similar
> fixed delay points. To manage these extra delays in a more general way,
> I introduced the "fsl,ump-wait-flags" property allowing the board-
> specific driver to specify various types of extra delay.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>

Acked-by: Anton Vorontsov <avorontsov@ru.mvista.com>
