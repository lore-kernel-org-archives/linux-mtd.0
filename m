Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZySvt-0004st-7d
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 23:11:34 +0000
Received: by pabfh17 with SMTP id fh17so192422940pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 15:11:12 -0800 (PST)
Date: Mon, 16 Nov 2015 15:11:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: mtd/sm_ftl.c: fix wrong do_div() usage
Message-ID: <20151116231110.GT8456@google.com>
References: <alpine.LFD.2.20.1511041519320.630@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1511041519320.630@knanqh.ubzr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 04, 2015 at 03:21:21PM -0500, Nicolas Pitre wrote:
> do_div() is meant to be used with an unsigned dividend.
> 
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Pushed to l2-mtd.git. Thanks!
