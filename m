Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh3dQ-0005cm-08
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 22:44:32 +0000
Received: by padhy16 with SMTP id hy16so18414151pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 15:44:10 -0700 (PDT)
Date: Tue, 29 Sep 2015 15:44:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
Message-ID: <20150929224408.GB143959@google.com>
References: <1437467420-22019-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1437467420-22019-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 21, 2015 at 04:30:20PM +0800, Dongsheng Yang wrote:
> We should prevent user to erasing mtd device with
> an unaligned offset or length.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Seems reasonable. Pushed to l2-mtd.git.
