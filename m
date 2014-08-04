Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEPn7-00015M-N5
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 21:27:41 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so41328pac.4
 for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2014 14:27:17 -0700 (PDT)
Date: Mon, 4 Aug 2014 14:27:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: denali: avoid using a magic number
Message-ID: <20140804212714.GE3711@ld-irv-0074>
References: <1405044846-21447-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1405044846-21447-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Huang Shijie <shijie8@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Rashika Kheria <rashika.kheria@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 11, 2014 at 11:14:05AM +0900, Masahiro Yamada wrote:
> MAP10 command with '0x2000' data sets up a read-ahead/write access.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Queued to l2-mtd.git/next.

Brian
