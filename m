Received: from mail-qa0-x230.google.com ([2607:f8b0:400d:c00::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoJs8-0001N7-7u
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 21:20:41 +0000
Received: by mail-qa0-f48.google.com with SMTP id w5so7136510qac.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 13:20:19 -0800 (PST)
Date: Wed, 4 Dec 2013 13:20:14 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH v2] mxc_nand: remove duplicated ecc_stats counting
Message-ID: <20131204212014.GB27149@ld-irv-0074.broadcom.com>
References: <1385730869-2322-1-git-send-email-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385730869-2322-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 02:14:29PM +0100, Michael Grzeschik wrote:
> The ecc_stats.corrected count variable will already be incremented in
> the above framework-layer just after this callback.
> 
> Cc: stable@vger.kernel.org

Added a 2.6.36+ note, just for reference.

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Pushed to l2-mtd.git. Thanks!

Brian
