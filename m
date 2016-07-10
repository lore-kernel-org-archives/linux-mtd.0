Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bM3tD-0002DF-9m
 for linux-mtd@lists.infradead.org; Sun, 10 Jul 2016 01:50:36 +0000
Received: by mail-pa0-x235.google.com with SMTP id dx3so23544327pab.2
 for <linux-mtd@lists.infradead.org>; Sat, 09 Jul 2016 18:50:13 -0700 (PDT)
Date: Sat, 9 Jul 2016 18:50:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] mtd: silence some uninitialized variable warnings
Message-ID: <20160710015008.GA7547@localhost>
References: <20160413064234.GE8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160413064234.GE8092@mwanda>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 13, 2016 at 09:42:34AM +0300, Dan Carpenter wrote:
> The "tmp_retlen" variable can be uninitialized if action() fails.  It's
> harmless except for the static checker warning.  I have moved the error
> handling earlier to fix it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to l2-mtd.git
