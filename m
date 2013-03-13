Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjw3-0002Fw-UO
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:33:32 +0000
Message-ID: <1363174446.11441.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/8] mtd: txx9ndfmc: Use module_platform_driver_probe macro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Wed, 13 Mar 2013 13:34:06 +0200
In-Reply-To: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
References: <1362473153-23515-1-git-send-email-sachin.kamat@linaro.org>
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

On Tue, 2013-03-05 at 14:15 +0530, Sachin Kamat wrote:
> module_platform_driver_probe() eliminates the boilerplate and simplifies
> the code.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Hi,

'Jingoo Han' <jg1.han@samsung.com> sent almost identical series a little
bit earlier than you, so his series just got into the l2-mtd.git tree.
Thanks!

-- 
Best Regards,
Artem Bityutskiy
