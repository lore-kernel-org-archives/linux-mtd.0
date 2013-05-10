Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uamsk-0005zV-SI
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 12:57:07 +0000
Message-ID: <1368190756.26780.160.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: r852: add CONFIG_PM_SLEEP to suspend/resume
 functions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Date: Fri, 10 May 2013 15:59:16 +0300
In-Reply-To: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
References: <000f01ce29ee$90692c10$b13b8430$%han@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-26 at 15:53 +0900, Jingoo Han wrote:
> Add CONFIG_PM_SLEEP to suspend/resume functions to fix the following
> build warning when CONFIG_PM_SLEEP is not selected. This is because
> sleep PM callbacks defined by SIMPLE_DEV_PM_OPS are only used when
> the CONFIG_PM_SLEEP is enabled. Also, unnecessary NULL defines are
> removed.

Pushed these 3 to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
