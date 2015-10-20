Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoLQl-0008AP-KQ
 for linux-mtd@lists.infradead.org; Tue, 20 Oct 2015 01:09:36 +0000
Received: by pabrc13 with SMTP id rc13so3142607pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2015 18:09:14 -0700 (PDT)
Date: Mon, 19 Oct 2015 18:09:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/3] mtd: mtdram: check offs and len in mtdram->erase
Message-ID: <20151020010912.GC13239@google.com>
References: <20150930002958.GC143959@google.com>
 <1443574881-12319-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1443574881-12319-2-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443574881-12319-2-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 30, 2015 at 09:01:19AM +0800, Dongsheng Yang wrote:
> We should prevent user to erasing mtd device with
> an unaligned offset or length.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Pushed patch 1 to l2-mtd.git. Thanks.
