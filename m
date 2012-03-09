Received: from mga03.intel.com ([143.182.124.21])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zMc-0002cy-F1
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 12:56:07 +0000
Message-ID: <1331297904.29445.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: fix partition wrapper functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 09 Mar 2012 14:58:24 +0200
In-Reply-To: <1330809186-3432-1-git-send-email-mikedunn@newsguy.com>
References: <1330809186-3432-1-git-send-email-mikedunn@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
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

On Sat, 2012-03-03 at 13:13 -0800, Mike Dunn wrote:
> This patch reverts a change that may have been mistakenly included
> with the set
> of patches that introduced the new mtd api entry functions.  Or
> perhaps I am
> mistaken :) 

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
