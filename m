Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPcA-0004PN-Qw
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:16:19 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so27599pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:15:57 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:15:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: ndfc: silence an array underflow static checker
 warning
Message-ID: <20140804211554.GW3711@ld-irv-0074>
References: <20140731153620.GH31539@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140731153620.GH31539@mwanda>
Cc: Grant Likely <grant.likely@linaro.org>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 31, 2014 at 06:36:20PM +0300, Dan Carpenter wrote:
> We check "cs" for array overflows but we don't check for underflows and
> it upsets the static checkers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Queued to l2-mtd.git/next.

Brian
