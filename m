Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjuW-0001zM-CC
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:31:57 +0000
Message-ID: <1363174367.11441.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] mtd: docg3: use module_platform_driver_probe()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Date: Wed, 13 Mar 2013 13:32:47 +0200
In-Reply-To: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
References: <005c01ce1959$e5833c90$b089b5b0$%han@samsung.com>
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

On Tue, 2013-03-05 at 13:28 +0900, Jingoo Han wrote:
> This patch uses module_platform_driver_probe() macro which makes
> the code smaller and simpler.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
