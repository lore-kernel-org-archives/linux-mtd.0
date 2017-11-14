Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEkCt-0007Kv-6Z
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 23:01:29 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990901AbdKNXBD7IES1 (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 15 Nov 2017 00:01:03 +0100
Date: Wed, 15 Nov 2017 00:01:03 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Roger Quadros <rogerq@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v4 02/16] ARM: dts: OMAP2+: Add compatible property to
 onenand node
Message-ID: <20171114230102.g75mq3xchgytqhy4@lenoch>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111211735.2a3q5lw4itsltjrw@lenoch>
 <ac576e3c-5df6-850f-c8d7-58aee395b3e9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac576e3c-5df6-850f-c8d7-58aee395b3e9@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 14, 2017 at 05:11:47PM +0200, Roger Quadros wrote:
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Oops? ^

> On 11/11/17 23:17, Ladislav Michl wrote:
> > OMAP onenand nodes are missing compatible property, add it.
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> 
> Acked-by: Roger Quadros <rogerq@ti.com>
> 
> How about updating bindings/mtd/gpmc-onenand.txt in a separate patch?

Already done, but I messed up sending, so you do not see first patch as reply
to cover letter. I'm sorry for that.

	ladis
