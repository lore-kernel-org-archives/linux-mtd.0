Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzWuU-0006ib-4R
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 21:38:30 +0000
Received: by pabfh17 with SMTP id fh17so96125570pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 13:38:09 -0800 (PST)
Date: Thu, 19 Nov 2015 13:38:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Andreas Fenkart <afenkart@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>
Subject: Re: [PATCH] spi-nor: mx25l3205d/mx25l6405d: append SECT_4K
Message-ID: <20151119213806.GJ64635@google.com>
References: <1446714263-4374-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446714263-4374-1-git-send-email-andreas.fenkart@dev.digitalstrom.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 05, 2015 at 10:04:23AM +0100, Andreas Fenkart wrote:
> according datasheet both chips can erase 4kByte sectors individually
> 
> Signed-off-by: Andreas Fenkart <andreas.fenkart@dev.digitalstrom.org>

Pushed to l2-mtd.git
