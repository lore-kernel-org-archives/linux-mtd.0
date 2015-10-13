Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm3zg-0007ry-JY
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 18:08:13 +0000
Received: by pacex6 with SMTP id ex6so27868600pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 11:07:51 -0700 (PDT)
Date: Tue, 13 Oct 2015 11:07:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fl004k
Message-ID: <20151013180749.GC107187@google.com>
References: <1444719030-26781-1-git-send-email-sean.nyekjaer@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444719030-26781-1-git-send-email-sean.nyekjaer@prevas.dk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 13, 2015 at 08:50:30AM +0200, Sean Nyekjaer wrote:
> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> ---
> Changes since v1:
> - Added support for both dual and quad read
> - Fixed JEDEC id

Applied to l2-mtd.git
