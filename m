Subject: Re: [PATCH] MTD: m25p80: add debugging trace in sst_write()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
In-Reply-To: <1292414372-17085-1-git-send-email-nicolas.ferre@atmel.com>
References: <1292414372-17085-1-git-send-email-nicolas.ferre@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Dec 2010 19:00:55 +0200
Message-ID: <1292778055.13362.8.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-15 at 12:59 +0100, Nicolas Ferre wrote:
> Add a DEBUG(MTD_DEBUG_LEVEL2, ..) trace at beginning of sst_write() function as
> it is done in m25p80_write() function.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>

So do you do this only becaus it is done in m25p80_write()? This is what
the commit message suggests... Have you found these DEBUG macros useful
for you? (I never found them any useful).

Anyway, I've put this to my l2-mtd-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
