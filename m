Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSgnZ-0004QR-QH
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 06:59:22 +0000
Received: by pdbnh10 with SMTP id nh10so22476372pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2015 22:59:00 -0800 (PST)
Date: Mon, 2 Mar 2015 22:58:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mtd: nand: MTD_NAND_HISI504 should depend on HAS_DMA
Message-ID: <20150303065853.GA29684@norris-Latitude-E6410>
References: <1425202552-27125-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425202552-27125-1-git-send-email-geert@linux-m68k.org>
Cc: linux-mtd@lists.infradead.org, Zhou Wang <wangzhou1@hisilicon.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 01, 2015 at 10:35:52AM +0100, Geert Uytterhoeven wrote:
> If NO_DMA=y:
> 
>     drivers/built-in.o: In function `hisi_nfc_probe':
>     hisi504_nand.c:(.text+0x23e646): undefined reference to `dmam_alloc_coherent'
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Looks good. Pushed to linux-mtd.git. Thanks!

Brian
