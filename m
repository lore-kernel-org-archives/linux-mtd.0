Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrnA-00051O-93
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 09:01:16 +0000
Received: by mail-pa0-f53.google.com with SMTP id kq14so3271782pab.40
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 02:00:54 -0700 (PDT)
Date: Wed, 22 Oct 2014 02:00:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rob Ward <robert.ward114@googlemail.com>
Subject: Re: [PATCH] mtd: phram: fix asm/io.h include usage
Message-ID: <20141022090051.GP16128@brian-ubuntu>
References: <alpine.DEB.2.10.1410212010210.7838@rob-thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1410212010210.7838@rob-thinkpad>
Cc: dwmw2@infradead.org, joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2014 at 08:14:00PM +0100, Rob Ward wrote:
> From ca36c5ca9adbe1d3c107e5ff22e8d0db5dddb1b9 Mon Sep 17 00:00:00 2001
> From: Rob Ward <robert.ward114@googlemail.com>
> Date: Tue, 21 Oct 2014 20:01:09 +0100
> Subject: [PATCH] mtd: phram: fix asm/io.h include usage
> 
> Modify phram to include <linux/io.h> rather than <asm/io.h>
> 
> Signed-off-by: Rob Ward <robert.ward114@googlemail.com>

Pushed to l2-mtd.git.

Brian
