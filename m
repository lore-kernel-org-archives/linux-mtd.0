Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAai7-0006VO-3Y
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2014 07:46:23 +0000
Message-ID: <1391499955.1795.32.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBI: fix some use after free bugs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Feb 2014 09:45:55 +0200
In-Reply-To: <20140129131756.GC10678@elgon.mountain>
References: <20140129131756.GC10678@elgon.mountain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-01-29 at 16:17 +0300, Dan Carpenter wrote:
> Move the kmem_cache_free() calls down a couple lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to linux-ubifs.git, thanks!

I'll send this to Linus for 3.13 inclusion.

-- 
Best Regards,
Artem Bityutskiy
