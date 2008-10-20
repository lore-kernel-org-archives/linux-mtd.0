Received: from mta23.gyao.ne.jp ([125.63.38.249] helo=mx.gate01.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krkoz-0004y9-F1
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 02:48:42 +0000
Date: Mon, 20 Oct 2008 11:48:21 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
Subject: Re: [RESEND][PATCH v2] mtd: sh_flctl: add support for Renesas SuperH
	FLCTL
Message-ID: <20081020024821.GB19540@linux-sh.org>
References: <48F48F3E.3080806@renesas.com>
	<20081020024701.GA19540@linux-sh.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081020024701.GA19540@linux-sh.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 20, 2008 at 11:47:01AM +0900, Paul Mundt wrote:
> On Tue, Oct 14, 2008 at 09:23:26PM +0900, Yoshihiro Shimoda wrote:
> > Several Renesas SuperH CPU has FLCTL. The FLCTL support NAND Flash.
> > This driver support SH7723.
> > 
> > Signed-off-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
> > Acked-by: Paul Mundt <lethal@linux-sh.org>
> 
> Please CC Andrew on this, as no one on the MTD side of things seems to be
> awake.

Scratch that, I see this version has been applied to the MTD git.
