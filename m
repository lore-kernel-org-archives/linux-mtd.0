Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBxjY-0008J4-A5
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 03:38:05 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so21613997pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 19:37:43 -0800 (PST)
Date: Thu, 15 Jan 2015 19:37:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH] nandsim: remove unused STATE_DATAOUT_STATUS_M and
 OPT_SMARTMEDIA
Message-ID: <20150116033740.GF9759@ld-irv-0074>
References: <1420981668-16545-1-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420981668-16545-1-git-send-email-akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 11, 2015 at 10:07:48PM +0900, Akinobu Mita wrote:
> There is no path to switch to STATE_DATAOUT_STATUS_M state, and
> OPT_SMARTMEDIA is unused.
> 
> This is leftover from commit 0be718e5525a73557e76ea1c05b8001dde507049
> ("mtd: nand: remove a bunch of unused commands").
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git. Thanks.

Brian
