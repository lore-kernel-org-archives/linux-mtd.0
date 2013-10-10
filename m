Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU4Ts-0006No-2Y
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 00:51:56 +0000
Received: by mail-ob0-f169.google.com with SMTP id wp4so1283991obc.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 17:51:34 -0700 (PDT)
Date: Wed, 9 Oct 2013 17:51:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] mtd: socrates_nand: Use dev_err instead of printk
Message-ID: <20131010005131.GI23337@ld-irv-0074.broadcom.com>
References: <1381226888-23901-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381226888-23901-1-git-send-email-sachin.kamat@linaro.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 03:38:08PM +0530, Sachin Kamat wrote:
> dev_err is preferred to printk.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git. Thanks!

Brian
