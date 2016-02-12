Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUJUa-0004Qx-Cj
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 19:35:14 +0000
Received: by mail-pf0-x241.google.com with SMTP id e127so4352588pfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 11:34:40 -0800 (PST)
Date: Fri, 12 Feb 2016 11:34:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fl116k
Message-ID: <20160212193437.GE21465@google.com>
References: <1455187224-1650-1-git-send-email-s.hauer@pengutronix.de>
 <1455188037-7695-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455188037-7695-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 11, 2016 at 11:53:57AM +0100, Sascha Hauer wrote:
> The Spansion s25fl116k is a 16MBit NOR Flash supporting dual and
> quad read operations.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to l2-mtd.git
