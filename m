Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAL8K-0003jc-G5
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 14:36:09 +0000
Message-ID: <1376664042.2089.378.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtd: create_freezable_workqueue() doesn't return an
 ERR_PTR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2013 17:40:42 +0300
In-Reply-To: <20130815075628.GC19280@elgon.mountain>
References: <20130815075628.GC19280@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-08-15 at 10:56 +0300, Dan Carpenter wrote:
> The create_freezable_workqueue() returns a NULL on error, it doesn't
> return an ERR_PTR.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
