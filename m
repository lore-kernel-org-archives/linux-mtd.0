Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcfuA-0006y3-La
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 18:58:55 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <ggrahammoore@gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
Date: Tue, 22 Apr 2014 20:58:30 +0200
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <201404221855.57247.marex@denx.de>
 <CA+iBjpR=CYd5JRs6u+BCbqicjoMqRwFRFRS7OFxOrYjetg5mgQ@mail.gmail.com>
In-Reply-To: <CA+iBjpR=CYd5JRs6u+BCbqicjoMqRwFRFRS7OFxOrYjetg5mgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404222058.30763.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Insop Song <insop.song@gainspeed.com>, Graham Moore <grmoore@altera.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
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

On Tuesday, April 22, 2014 at 08:48:21 PM, Graham Moore wrote:
> On Tue, Apr 22, 2014 at 11:55 AM, Marek Vasut <marex@denx.de> wrote:
> > Are you sure the n25q512a doesn't use FSR ? Do n25q512a{1,8}3 share the
> > same IDs?
> 
> I looked at the datasheet and the n25q512a *does* have the same FSR
> usage note, so I suppose I should add USE_FSR to it as well.  But how
> is it working now?

Is it at all ?

> Maybe nobody is actually using that chip.
> Yes, n25q512a{1,8}3 share the same id, 0x20ba20.

Sigh, oh Micron ...

Best regards,
Marek Vasut
