Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8uV-0005C9-Sz
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 19:04:32 +0000
Received: by mail-pd0-f176.google.com with SMTP id z10so3648693pdj.21
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 12:04:10 -0700 (PDT)
Date: Mon, 22 Sep 2014 12:04:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 3/3] mtd: nand: Force omap_elm to be built as a module if
 omap2_nand is a module
Message-ID: <20140922190407.GU1193@ld-irv-0074>
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410443224-18477-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <5412B66F.8050505@ti.com> <20140912165636.GA7276@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140912165636.GA7276@arch>
Cc: Tony Lindgren <tony@atomide.com>, pekon <pekon@pek-sem.com>,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 12, 2014 at 05:56:36PM +0100, Ezequiel Garcia wrote:
> Ultimately, I don't care much as I don't think anyone will build it as a module,
> except maybe for testing the driver under probe/remove cycles.

I see that you sort of answered one of my questions here. On what do you
base this claim? I see maintstream distros are gaining support for some
common ARM platforms, and I bet they ship loadable modules. Or are you
seeing otherwise?

Brian
