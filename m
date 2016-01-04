Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGEam-0006Zc-3t
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 23:31:12 +0000
Received: by mail-pf0-x22f.google.com with SMTP id 65so164419371pff.3
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 15:30:51 -0800 (PST)
Date: Mon, 4 Jan 2016 15:30:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/6] MTD: lantiq: xway: various nand fixes
Message-ID: <20160104233049.GA128501@google.com>
References: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451941501-42952-1-git-send-email-blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 04, 2016 at 10:04:55PM +0100, John Crispin wrote:
> This series adds various fixes for the nand driver used on Lantiq DSL SoC.

Is there a good reason this driver uses plat_nand? That seems like an
unnecessary abstraction layer. It'd be clearer to just refactor the
driver to be a proper platform driver...

Also, I see that there's no DT binding doc.

Can these things be cleaned up?

Brian
