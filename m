Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFSl-0005xw-E8
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 06:39:16 +0000
Received: by pacyx8 with SMTP id yx8so31628971pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 23:38:54 -0700 (PDT)
Date: Wed, 6 May 2015 23:38:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/5] mtd: nand: misc BBT fixes
Message-ID: <20150507063850.GB6055@norris-Latitude-E6410>
References: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425118393-25179-1-git-send-email-computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 Alexander Shiyan <shc_work@mail.ru>,
 Peter Pan =?utf-8?B?5r2Y5qCLIChwZXRlcnBhbmRvbmcp?= <peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 28, 2015 at 02:13:08AM -0800, Brian Norris wrote:
> A few assorted changes. Some of these are geared toward refactoring the BBT
> code for being reused for SPI NAND.
> 
> If possible, I'd really like to get some testing for the diskonchip changes.
> It's an old driver, but it appears as if some still use it. Perhaps Alexander
> (CC'd) can report?

Pushed all 5 to l2-mtd.git, since the only comments I got were reposts
of the patches...

Brian
