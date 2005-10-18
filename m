Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES14t-0003AB-1x
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 19:41:10 -0400
Date: Wed, 19 Oct 2005 01:39:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jesper Juhl <jesper.juhl@gmail.com>
Message-ID: <20051018233934.GD20236@wohnheim.fh-wedel.de>
References: <200510132126.13411.jesper.juhl@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200510132126.13411.jesper.juhl@gmail.com>
Cc: Andrew Morton <akpm@osdl.org>, Simon Evans <spse@secret.org.uk>,
	Greg Ungerer <gerg@snapgear.com>, source@mvista.com,
	Nicolas Pitre <nico@cam.org>, jzhang@ti.com,
	linux-kernel <linux-kernel@vger.kernel.org>, jamey.hicks@hp.com,
	Ben Dooks <ben@simtec.co.uk>, Kirk Lee <kirk@hpc.ee.ntu.edu.tw>,
	linux-mtd@lists.infradead.org, Eric Brower <ebrower@usa.net>,
	"Steven J. Hill" <sjhill@realitydiluted.com>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 03/14] Big kfree NULL check cleanup - drivers/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 October 2005 21:26:12 +0200, Jesper Juhl wrote:
> 
> This is the drivers/mtd part of the big kfree cleanup patch.
> 
> Remove pointless checks for NULL prior to calling kfree() in drivers/mtd/.
> 
> 
> Sorry about the long Cc: list, but I wanted to make sure I included everyone
> who's code I've changed with this patch.
> 
> 
> Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
Acked-by: Jörn Engel <joern@wohnheim.fh-wedel.de>

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
