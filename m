Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YahPa-0003En-BQ
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 09:15:42 +0000
Message-ID: <1427274916.30360.36.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: fix incorrect unlocking handling
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 25 Mar 2015 11:15:16 +0200
In-Reply-To: <1427273617-13692-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
 <1427273617-13692-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: taesoo@gatech.edu, Subodh Nijsure <snijsure@grid-net.com>,
 Shelton <ben.shelton@ni.com>, sanidhya@gatech.edu, adrian.hunter@intel.com,
 Terry Wilcox <terry.wilcox@ni.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, blee@gatech.edu, Taesoo Kim <tsgatesv@gmail.com>,
 Gratian Crisan <gratian.crisan@ni.com>, csong84@gatech.edu,
 changwoo@gatech.edu, Brad Mouring <brad.mouring@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-03-25 at 09:53 +0100, Uwe Kleine-König wrote:
> From: Taesoo Kim <tsgatesv@gmail.com>
> 
> When ubifs_init_security() fails, 'ui_mutex' is incorrectly
> unlocked and incorrectly restores 'i_size'. Fix this.
> 
> Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>
> Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
> Reviewed-by: Ben Shelton <ben.shelton@ni.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

OK, I picked your version of the patch, thanks!
