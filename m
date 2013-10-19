Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXWGx-0003Se-8S
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 13:08:51 +0000
Date: Sat, 19 Oct 2013 10:08:47 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: use a local variable to simplify the
 nand_scan_tail
Message-ID: <20131019130846.GB2470@localhost>
References: <1382077253-21709-1-git-send-email-b32955@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2866E@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA2866E@DBDE04.ent.ti.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 18, 2013 at 02:11:19PM +0000, Gupta, Pekon wrote:
> > From: Huang Shijie
> > There are too many "chip->ecc" in the nand_scan_tail() which makes the
> > eyes
> > sore.
> > 
> > This patch uses a local variable "ecc" to replace the "chip->ecc" to
> > make the code more graceful.
> > 
> > Do the code change with "s/chip->ecc\./ecc->/g" in the nand_scan_tail,
> > and also change some lines by hand.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > 
> Personally I won't prefer such stand-alone cleanup  _unless_ there is
> major driver re-write of the code, because this breaks the traceability
> via 'git blame'. And even in that case, this change should be applied first,
> and the other functional updates later.
> 

Hm.. I'm not sure I agree here. I like this patch and I like the effect
it has on nand_scan_tail().

On a personal note, I hardly ever use git blame at all (because it's dead
slow). Instead, I just run git log ${file} and get the latest changes on
that file.

So, for what it's worth, I think it should be merged.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
