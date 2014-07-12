Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5mnr-0008QC-1v
 for linux-mtd@lists.infradead.org; Sat, 12 Jul 2014 02:12:43 +0000
Received: by mail-ie0-f178.google.com with SMTP id tp5so1495512ieb.23
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jul 2014 19:12:21 -0700 (PDT)
Date: Fri, 11 Jul 2014 19:12:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Graham Moore <grmoore@altera.com>
Subject: Re: [PATCH V4] Add support for flag status register on Micron chips.
Message-ID: <20140712021217.GM7537@ld-irv-0074>
References: <1398785391-10744-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398785391-10744-1-git-send-email-grmoore@altera.com>
Cc: ZY - marex <marex@denx.de>, ggrahammoore@gmail.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Graham,

On Tue, Apr 29, 2014 at 10:29:51AM -0500, Graham Moore wrote:
> Some new Micron flash chips require reading the flag
> status register to determine when operations have completed.
> 
> Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> require reading the status register before reading the flag status register.
> 
> This patch adds support for the flag status register in the n25q512ax3 and n25q00
> Micron QSPI flash chips.
> 
> Signed-off-by: Graham Moore <grmoore@altera.com>
> ---
> V4:
> Do not set nor->wait_till_ready if driver has already set it.
> V3:
> Rebase to l2-mtd spinor branch.
> V2:
> Remove leading underscore in function names.
> Remove type cast in dev_err call and use the proper format
> specifier instead.

Sorry for the delay... pushed to l2-mtd.git. Thanks!

Brian
