Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YckL8-0004SO-S9
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 00:47:35 +0000
Received: by patj18 with SMTP id j18so2398583pat.2
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 17:47:13 -0700 (PDT)
Date: Mon, 30 Mar 2015 17:47:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] jffs2: remove an unneeded condition
Message-ID: <20150331004710.GH32500@ld-irv-0074>
References: <20150323093519.GB558@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150323093519.GB558@mwanda>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 23, 2015 at 12:35:19PM +0300, Dan Carpenter wrote:
> We know "rc" is set so there is no need to check again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git.

Brian
