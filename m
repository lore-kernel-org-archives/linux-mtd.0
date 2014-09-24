Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWloj-0003ke-EF
 for linux-mtd@lists.infradead.org; Wed, 24 Sep 2014 12:37:09 +0000
Message-ID: <1411562205.23429.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix livelock in produce_free_peb()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 24 Sep 2014 15:36:45 +0300
In-Reply-To: <1411141076-21489-1-git-send-email-richard@nod.at>
References: <1411141076-21489-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-09-19 at 17:37 +0200, Richard Weinberger wrote:
> The while loop in produce_free_peb() assumes that each work will produce a
> free PEB. This is not true.
> If ubi->works_count is 1 and the only scheduled work is the
> wear_leveling_worker() produce_free_peb() can loop forever in case
> nobody schedules an erase work.
> Fix this issue by checking in the while loop whether work is scheduled.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy
