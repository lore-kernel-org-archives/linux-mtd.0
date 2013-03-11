Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UExWL-0002Is-Ug
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 07:51:46 +0000
Message-ID: <1362988316.5101.34.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] flash_otp_write: fix writing to NAND in presence of
 partial reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 11 Mar 2013 09:51:56 +0200
In-Reply-To: <1362044529-511-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1362044529-511-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-28 at 10:42 +0100, Uwe Kleine-König wrote:
> When doing something like:
> 
> 	{ printf "\xff"; printf "\xfe"; } | flash_otp_write -u /dev/mtd0 0
> 
> flash_otp_write might see only a single byte when reading from stdin for
> the first tim. In this case (and without this patch) it pads to
> $writesize with '\xff's and writes that out. In the next iteration it
> reads the 2nd byte, pads and writes again. So the 2nd byte is written to
> offset $writesize instead of 1.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Pushed both to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
