Received: from isilmar-3.linta.de ([188.40.101.200] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OpnMF-0008T8-BH
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 19:16:00 +0000
Date: Sun, 29 Aug 2010 21:15:49 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [patch] mtd/pcmciamtd: remove dead code
Message-ID: <20100829191549.GA753@isilmar-3.linta.de>
References: <20100824115627.GD29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100824115627.GD29330@bicker>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org,
	Magnus Damm <damm@opensource.se>, Alexander Kurz <linux@kbdbabel.org>,
	linux-mtd@lists.infradead.org, Karsten Keil <keil@b1-systems.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 24, 2010 at 01:56:27PM +0200, Dan Carpenter wrote:
> This code isn't reachable.  I looked through the git history and it
> hasn't been reachable for years.  Someone removed the label to silence
> gcc's unused label warning but these few lines accidentally got left
> behind.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
