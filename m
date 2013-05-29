Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uhgj6-0006jN-8k
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 13:47:41 +0000
Message-ID: <1369835425.24286.28.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: fastmap break out of used PEB search
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Date: Wed, 29 May 2013 16:50:25 +0300
In-Reply-To: <1367453444-12988-1-git-send-email-bapper@gmail.com>
References: <y> <1367453444-12988-1-git-send-email-bapper@gmail.com>
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

On Wed, 2013-05-01 at 17:10 -0700, Brian Pomerantz wrote:
> While searching for PEB matches for each volume in the used PEB list,
> the search fails to stop when the PEB is found.  This patch adds
> a break in the inner loop to stop the search when it is matched.
> 
> Signed-off-by: Brian Pomerantz <bapper@gmail.com>

Pushed to linux-ubi.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
