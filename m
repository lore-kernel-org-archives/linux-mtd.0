Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5jXy-0007oY-5g
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 01:57:43 +0000
Received: by mail-pf0-x242.google.com with SMTP id g23so1924939pfj.1
 for <linux-mtd@lists.infradead.org>; Tue, 02 May 2017 18:57:20 -0700 (PDT)
Date: Tue, 2 May 2017 18:57:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexander Couzens <lynxis@fe80.eu>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Stable <stable@vger.kernel.org>
Subject: Re: [PATCH][v3] mtd: nand: add ooblayout for old hamming layout
Message-ID: <20170503015717.GA70297@google.com>
References: <20170502081323.3138-1-lynxis@fe80.eu>
 <20170502101900.5066-1-lynxis@fe80.eu>
 <20170502140300.33ac055d@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170502140300.33ac055d@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 02, 2017 at 02:03:00PM +0200, Boris Brezillon wrote:
> +Brian
> 
> On Tue,  2 May 2017 12:19:00 +0200
> Alexander Couzens <lynxis@fe80.eu> wrote:
> 
> > The old 1-bit hamming layout requires ECC data to be placed at a
> > fixed offset, and not necessarily at the end of the OOB area.
> > Add this old layout back in order to fix legacy setups.
> > 
> > Fixes: 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
> > CC: Stable <stable@vger.kernel.org>
> > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Brian, maybe you can consider taking this patch directly in
> l2-mtd/master before preparing your PR to Linus (if you're happy with
> the patch of course). Otherwise, I'll take it into my tree and send a
> fixes PR after 4.12-rc1 is out.

Applied to l2-mtd.git/master.
