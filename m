Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVHq-0001AZ-St
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:33:51 +0000
Received: by mail-pa0-f42.google.com with SMTP id lj1so806044pab.1
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:33:29 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:33:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: denali: fix include guard and license block of
 denali.h
Message-ID: <20140918063326.GL7362@norris-Latitude-E6410>
References: <1409310051-25726-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409310051-25726-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 29, 2014 at 08:00:51PM +0900, Masahiro Yamada wrote:
> It looks like this header file is a concatenation of two headers.
> Anyway, the include guard should be renamed and placed at the correct
> postion and the license block in the middle should be deleted.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Pushed to l2-mtd.git. Thanks!

Brian
