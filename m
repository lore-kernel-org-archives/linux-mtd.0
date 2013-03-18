Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHUVO-0000ZZ-P9
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 07:29:15 +0000
Message-ID: <1363591822.20738.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/5] mtd: dataflash: Use of_match_ptr() macro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Mon, 18 Mar 2013 09:30:22 +0200
In-Reply-To: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
References: <1363255624-20885-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-03-14 at 15:37 +0530, Sachin Kamat wrote:
> This eliminates having an #ifdef returning NULL for the case
> when OF is disabled.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed all to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
