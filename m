Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFisD-0005Md-2R
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:25:30 +0000
Message-ID: <1363170376.9457.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 13 Mar 2013 12:26:16 +0200
In-Reply-To: <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
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

On Mon, 2013-03-04 at 17:47 +0100, Uwe Kleine-König wrote:
> According to the Open NAND Flash Interface Specification (ONFI) Revision
> 3.1 "Parameters are always transferred on the lower 8-bits of the data
> bus." for the Get Features and Set Features commands.
> 
> So using read_buf and write_buf is wrong for 16-bit wide nand chips as
> they use I/O[15:0]. The Get Features command is easily fixed using 4
> times the read_byte callback. For Set Features implement a new
> overwritable callback "write_byte". Still I expect the default to work
> just fine for all controllers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
