Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UNmAi-0003iJ-60
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2013 15:33:52 +0000
Message-ID: <1365089706.626.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: omap2: fix IOERR
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 04 Apr 2013 18:35:06 +0300
In-Reply-To: <1363369499-29459-1-git-send-email-computersforpeace@gmail.com>
References: <CAGNmLEPEkre4SwbVgBYhDPhqC+tkn-aLp9-bTjh8dv90Yo6_tw@mail.gmail.com>
 <1363369499-29459-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Toan Pham <tpham3783@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-03-15 at 10:44 -0700, Brian Norris wrote:
> From: Toan Pham <tpham3783@gmail.com>
> 
> Fix mtd-utils from returning -EIO.
> Formatting jffs2 filesystem was impossible when CONFIG_HZ was set to a low
> value.
> 
> Signed-off-by: Toan Pham <tpham3783@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
