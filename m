Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUvjN-0003ZH-4t
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 10:48:01 +0000
Message-ID: <1411123647.28850.138.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 19 Sep 2014 13:47:27 +0300
In-Reply-To: <541BFB6D.3040903@nod.at>
References: <1410853702-11616-1-git-send-email-richard@nod.at>
 <1410946526.28850.120.camel@sauron.fi.intel.com> <541BFB6D.3040903@nod.at>
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

On Fri, 2014-09-19 at 11:46 +0200, Richard Weinberg
> Or we apply "[PATCH 1/2] UBI: Call worker functions without work_sem held". :)

But I explained in the other e-mail that the semaphore is needed, and
why.

-- 
Best Regards,
Artem Bityutskiy
