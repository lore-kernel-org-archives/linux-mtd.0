Received: from mail-qa0-x231.google.com ([2607:f8b0:400d:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYk3s-0006XR-6M
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 22:04:24 +0000
Received: by mail-qa0-f49.google.com with SMTP id i13so65513qae.1
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 15:04:02 -0700 (PDT)
Date: Tue, 22 Oct 2013 15:03:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] mtd: plat-ram: Use module_platform_driver
Message-ID: <20131022220354.GN23337@ld-irv-0074.broadcom.com>
References: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381466485-7534-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, zajec5@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 11, 2013 at 10:11:23AM +0530, Sachin Kamat wrote:
> module_platform_driver simplifies the code by removing boiler
> plate.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed all 3 to l2-mtd.git. Thanks!

Brian
