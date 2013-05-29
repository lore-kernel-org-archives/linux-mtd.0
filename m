Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uhgjh-0006kG-Qf
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 13:48:18 +0000
Message-ID: <1369835469.24286.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: tests: don't print error messages when out-of-memory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 29 May 2013 16:51:09 +0300
In-Reply-To: <1367529531-17254-1-git-send-email-computersforpeace@gmail.com>
References: <1367529531-17254-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-02 at 14:18 -0700, Brian Norris wrote:
> These strings are now unnecessary and discouraged in the kernel. The
> kernel will have plenty of big scary messages if kmalloc fails. These
> now only serve to bloat the module.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
