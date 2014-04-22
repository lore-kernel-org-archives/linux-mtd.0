Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcgCr-0000B9-Ie
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 19:18:13 +0000
Received: by mail-lb0-f177.google.com with SMTP id z11so4642313lbi.22
 for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2014 12:17:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201404221855.57247.marex@denx.de>
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <1398175396-7560-2-git-send-email-grmoore@altera.com>
 <201404221855.57247.marex@denx.de>
Date: Tue, 22 Apr 2014 13:48:21 -0500
Message-ID: <CA+iBjpR=CYd5JRs6u+BCbqicjoMqRwFRFRS7OFxOrYjetg5mgQ@mail.gmail.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
From: Graham Moore <ggrahammoore@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
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

On Tue, Apr 22, 2014 at 11:55 AM, Marek Vasut <marex@denx.de> wrote:
> Are you sure the n25q512a doesn't use FSR ? Do n25q512a{1,8}3 share the same
> IDs?

I looked at the datasheet and the n25q512a *does* have the same FSR
usage note, so I suppose I should add USE_FSR to it as well.  But how
is it working now?  Maybe nobody is actually using that chip.
Yes, n25q512a{1,8}3 share the same id, 0x20ba20.
