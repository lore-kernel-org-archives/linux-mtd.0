Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyObG-0007tx-11
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 18:33:59 +0000
Received: by pabfh17 with SMTP id fh17so185595894pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 10:33:36 -0800 (PST)
Date: Mon, 16 Nov 2015 10:33:33 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, baruch@tkos.co.il,
 dwmw2@infradead.org, fransklaver@gmail.com, k.kozlowski.k@gmail.com,
 luis@debethencourt.com, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: mxc_nand: fix a possible NULL dereference
Message-ID: <20151116183333.GL8456@google.com>
References: <1447314423-31225-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112081909.GD24008@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151112081909.GD24008@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 09:19:09AM +0100, Uwe Kleine-König wrote:
> I really wonder there is no helper
> function like:
> 
> 	#define of_sensible_name(dev)	of_match_device(dev->driver->of_match_table, dev)

How about of_device_get_match_data()?

It's not exactly what you asked for, but it gets what you need here.

Brian
