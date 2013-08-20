Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBdXr-0001Kn-Lw
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 04:27:52 +0000
Received: by mail-pd0-f179.google.com with SMTP id v10so6080107pde.24
 for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2013 21:27:30 -0700 (PDT)
Date: Mon, 19 Aug 2013 21:27:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 4/4] mtd: m25p80: remove unnecessary ifdef
Message-ID: <20130820042726.GF28421@norris.computersforpeace.net>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
 <1376302946-11534-5-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376302946-11534-5-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 12:22:26PM +0200, Sascha Hauer wrote:
> of_property_read_bool properly compiles away, no need to ifdef this
> for non DT builds.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Pushed only this one to l2-mtd.git, since it's independent.

Thanks,
Brian
