Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstdL-0002Oo-Rm
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 09:06:44 +0000
Received: by wwb29 with SMTP id 29so1272389wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 01:06:42 -0800 (PST)
Subject: Re: [PATCH 09/29] t7166xb: mfd_cell is now implicitly available to
	drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
In-Reply-To: <1297998456-7615-10-git-send-email-dilinger@queued.net>
References: <1297998456-7615-1-git-send-email-dilinger@queued.net>
	<1297998456-7615-10-git-send-email-dilinger@queued.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 11:05:12 +0200
Message-ID: <1298624712.2798.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	linux-mtd@lists.infradead.org, Samuel Ortiz <sameo@linux.intel.com>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-02-17 at 19:07 -0800, Andres Salomon wrote:
> No need to explicitly set the cell's platform_data/data_size.
> 
> Modify clients to use mfd_get_cell helper function instead of
> accessing platform_data directly.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>

Just to re-confirm, I suggest to merge these MTD changes via Samuel's
tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
