Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhONo-0001lW-ON
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 20:53:49 +0000
Received: by pablk4 with SMTP id lk4so50317004pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 13:53:27 -0700 (PDT)
Date: Wed, 30 Sep 2015 13:53:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-sh@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] sh: mach-rsk: remove unnecessary MTD partition probe
 specification
Message-ID: <20150930205324.GJ143959@google.com>
References: <1431991470-22388-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431991470-22388-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 18, 2015 at 04:24:30PM -0700, Brian Norris wrote:
> The cmdlinepart parser is already supported in the default probe.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

SuperH is "orphaned", but this patch is trivial. Applied to l2-mtd.git.
