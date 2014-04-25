Received: from mail-by2lp0238.outbound.protection.outlook.com
 ([207.46.163.238] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdYwH-0006Md-6E
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 05:44:46 +0000
Date: Fri, 25 Apr 2014 12:47:04 +0800
From: Huang Shijie <b32955@freescale.com>
To: Graham Moore <ggrahammoore@gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
Message-ID: <20140425044703.GD24530@localhost>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <1398175396-7560-2-git-send-email-grmoore@altera.com>
 <201404221855.57247.marex@denx.de>
 <CA+iBjpR=CYd5JRs6u+BCbqicjoMqRwFRFRS7OFxOrYjetg5mgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+iBjpR=CYd5JRs6u+BCbqicjoMqRwFRFRS7OFxOrYjetg5mgQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Insop Song <insop.song@gainspeed.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jingoo Han <jg1.han@samsung.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Graham Moore <grmoore@altera.com>,
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

On Tue, Apr 22, 2014 at 01:48:21PM -0500, Graham Moore wrote:
> On Tue, Apr 22, 2014 at 11:55 AM, Marek Vasut <marex@denx.de> wrote:
> > Are you sure the n25q512a doesn't use FSR ? Do n25q512a{1,8}3 share the same
> > IDs?
> 
> I looked at the datasheet and the n25q512a *does* have the same FSR
> usage note, so I suppose I should add USE_FSR to it as well.  But how
> is it working now?  Maybe nobody is actually using that chip.
> Yes, n25q512a{1,8}3 share the same id, 0x20ba20.
> 
could use the ext_id to distinguish them ? just as we did for Spansion NOR.

i dumped out 5 bytes of my n25q256a: 0x20, 0xba, 0x19, 0x10, 0x00.

thanks
Huang Shijie
