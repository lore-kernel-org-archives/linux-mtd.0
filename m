Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Poua8-0007h6-GD
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 09:18:56 +0000
Received: by wyf22 with SMTP id 22so4287675wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2011 01:18:55 -0800 (PST)
Subject: Re: [PATCH 09/17] t7166xb: mfd_cell is now implicitly available to
	drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
In-Reply-To: <20110211181101.3a4325e4@queued.net>
References: <20110211181101.3a4325e4@queued.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Feb 2011 11:17:44 +0200
Message-ID: <1297675064.2854.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 18:11 -0800, Andres Salomon wrote:
> No need to explicitly set the cell's platform_data/data_size.
> 
> Modify clients to use mfd_get_cell helper function instead of
> accessing platform_data directly.

Wold it be possible to separate out MTD-related changes?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
