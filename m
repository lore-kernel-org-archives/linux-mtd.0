Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtYXl-0001SS-Cs
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 07:29:02 +0000
Message-ID: <1372663671.22014.30.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 01/26] mtd: devices: spear_smi: remove unnecessary
 platform_set_drvdata()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Date: Mon, 01 Jul 2013 10:27:51 +0300
In-Reply-To: <004001ce4aea$91d214f0$b5763ed0$@samsung.com>
References: <004001ce4aea$91d214f0$b5763ed0$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-05-07 at 15:17 +0900, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed the series to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
