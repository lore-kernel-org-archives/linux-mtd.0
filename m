Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZlhV-0002ZZ-S6
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 18:01:34 +0000
Received: by mail-ie0-f178.google.com with SMTP id x13so6987660ief.37
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2013 11:01:13 -0700 (PDT)
Date: Fri, 25 Oct 2013 11:01:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/5] mtd: m25p80: remove 'disabled' device check
Message-ID: <20131025180109.GJ20061@ld-irv-0074.broadcom.com>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-5-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382583503-13748-5-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 Grant Likely <grant.likely@linaro.org>, sourav.poddar@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 07:58:23PM -0700, Brian Norris wrote:
> It seems like the following commit was never necessary
> 
>     commit 5f949137952020214cd167093dd7be448f21c079
>     Author: Shaohui Xie <Shaohui.Xie@freescale.com>
>     Date:   Fri Oct 14 15:49:00 2011 +0800
> 
>         mtd: m25p80: don't probe device which has status of 'disabled'
> 
> because it duplicates the code in of_platform_device_create_pdata()
> which ensures that 'disabled' nodes are never instantiated.
> 
> Also, drop the __maybe_unused.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: <devicetree@vger.kernel.org>

Pushed to l2-mtd.git.

Brian
