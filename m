Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UO5MB-0004XN-Ou
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2013 12:03:00 +0000
Message-ID: <1365163475.626.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: bf5xx_nand: Use module_platform_driver()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 05 Apr 2013 15:04:35 +0300
In-Reply-To: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
References: <1363605410-4530-1-git-send-email-sachin.kamat@linaro.org>
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

On Mon, 2013-03-18 at 16:46 +0530, Sachin Kamat wrote:
> module_platform_driver macro removes some boilerplate and makes
> the code simpler.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed these 2 to l2-mtd.git too, thanks!

-- 
Best Regards,
Artem Bityutskiy
