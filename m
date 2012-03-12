Received: from mga14.intel.com ([143.182.124.37])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S74wz-0000Nh-44
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2012 13:06:10 +0000
Message-ID: <1331557710.12037.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] Makefile: fix "make clean" for old GNU find
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 12 Mar 2012 15:08:30 +0200
In-Reply-To: <1331315349-8541-1-git-send-email-computersforpeace@gmail.com>
References: <1331315349-8541-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-03-09 at 09:49 -0800, Brian Norris wrote:
> findutils v4.1.x does not have the `-exec CMD {} +' syntax. We can just as
> easily use the `-exec CMD {} \;' syntax. However, it will launch a lot more
> `rm' processes, so we only use it if the first form fails with an error.
> This isn't a perfect solution (`find -exec +' can fail for other reasons)
> but it works well enough.
> 
> This problem manifests itself in RHEL 4, findutils 4.1.20:

Pushed, thanks you!

-- 
Best Regards,
Artem Bityutskiy
