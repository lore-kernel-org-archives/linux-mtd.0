Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYdqV-0001IA-K3
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 15:58:27 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so5556640pad.14
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 08:58:06 -0700 (PDT)
Date: Fri, 11 Apr 2014 23:57:51 +0800
From: Huang Shijie <shijie8@gmail.com>
To: grmoore@altera.com
Subject: Re: [PATCH V2] Add support for flag status register on Micron chips.
Message-ID: <20140411155747.GA1584@localhost.localdomain>
References: <1397228593-17996-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397228593-17996-1-git-send-email-grmoore@altera.com>
Cc: Marek Vasut <marex@denx.de>, ggrahammoore@gmail.com,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 11, 2014 at 10:03:13AM -0500, grmoore@altera.com wrote:
> From: Graham Moore <grmoore@altera.com>
> 
> Some new Micron flash chips require reading the flag
> status register to determine when operations have completed.
> 
> Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> require reading the status register before reading the flag status register.
> 
> This patch adds support for the flag status register in the n25q512a1 and n25q00
> Micron QSPI flash chips.
> 
> Signed-off-by: Graham Moore <grmoore@altera.com>
> ---
> V2:
> Remove leading underscore in function names.
> Remove type cast in dev_err call and use the proper format
> specifier instead.
> ---
>  drivers/mtd/devices/m25p80.c |   91 ++++++++++++++++++++++++++++++++++++------
please rebase this patch on the latest l2-mtd, branch spinor.

thanks
Huang Shijie
