Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8LwK-0006am-Vx
 for linux-mtd@lists.infradead.org; Sun, 11 Aug 2013 03:03:34 +0000
Received: by mail-pa0-f51.google.com with SMTP id lf1so3444674pab.38
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 20:03:10 -0700 (PDT)
Message-ID: <5207A8C7.4050101@gmail.com>
Date: Sun, 11 Aug 2013 11:07:51 -0400
From: Huang Shijie <shijie8@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 4/4] mtd: gpmi: update the ecc step size for mtd_info{}
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
 <1368607606-4344-5-git-send-email-b32955@freescale.com>
 <20130810074156.GB3467@norris.computersforpeace.net>
 <CAN8TOE8NhcYBP_x26=KC2yBUSS3xzVjMg+PHnxNNRNJWWLeSeg@mail.gmail.com>
In-Reply-To: <CAN8TOE8NhcYBP_x26=KC2yBUSS3xzVjMg+PHnxNNRNJWWLeSeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年08月10日 03:53, Brian Norris 写道:
> The right way seems to be to avoid nand_scan() directly but instead to
> >  use nand_scan_ident() and nand_scan_tail() separately (that's what
> >  they're exported for) so that you can initialize any geometry-related
> >  options before nand_scan_tail() does the last steps.
i agree with you.
I will create a v3 version tomorrow when i back to office.

thanks for the review.
Huang Shijie
