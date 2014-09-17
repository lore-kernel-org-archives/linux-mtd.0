Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUAbc-0005NM-7b
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 08:28:52 +0000
Message-ID: <1410942507.28850.78.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 17 Sep 2014 11:28:27 +0300
In-Reply-To: <1410853702-11616-1-git-send-email-richard@nod.at>
References: <1410853702-11616-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-16 at 09:48 +0200, Richard Weinberger wrote:
> If sync_erase() failes with EINTR, ENOMEM, EAGAIN or
> EBUSY erase_worker() re-schedules the failed work.
> This will lead to a deadlock because erase_worker() is called
> with work_sem held in read mode. And schedule_erase() will take
> this lock again.

IIRC, the assumption was that the R/W semaphore may be taken in read
mode many times, so it wouldn't hurt to do:

down_read()
down_read()
up_read()
up_read()

If this is right, then the lockdep warning is incorrect.

-- 
Best Regards,
Artem Bityutskiy
