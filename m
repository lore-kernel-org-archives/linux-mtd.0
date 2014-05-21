Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmug1-0004h1-Q6
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 00:46:38 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so828951pad.37
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 17:46:16 -0700 (PDT)
Date: Tue, 20 May 2014 17:46:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
Subject: Re: [PATCH v4] mtd: lpddr: add driver for LPDDR2-NVM PCM memories
Message-ID: <20140521004608.GA22233@ld-irv-0074>
References: <20140514161917.GJ28907@ld-irv-0074>
 <1400188772-2247-1-git-send-email-vincenzo.aliberti@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400188772-2247-1-git-send-email-vincenzo.aliberti@gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 15, 2014 at 11:19:32PM +0200, Vincenzo Aliberti wrote:
> MTD: LPDDR: Add Driver for LPDDR2-NVM PCM memories
> 
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> 
> ---
> Changes in v4:
> 	- Improved error handling
> 	- Size now managed using resource_size(add_range)

Pushed to l2-mtd.git. Thanks!

Brian
