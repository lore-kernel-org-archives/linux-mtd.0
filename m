Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UO5Lr-0004K4-S1
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2013 12:02:40 +0000
Message-ID: <1365163454.626.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: denali_dt: Fix incorrect error check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 05 Apr 2013 15:04:14 +0300
In-Reply-To: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
References: <1363599674-26933-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dinguyen@altera.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-18 at 15:11 +0530, Sachin Kamat wrote:
> The return value of devm_ioremap_nocache should be checked here instead
> of res.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

All look good, pushed the series to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
