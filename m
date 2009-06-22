Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MImD7-00071i-LW
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 16:17:40 +0000
Subject: Re: [PATCH] ubi: gluebi_{read,write} len + {from,to} can exceed
	mtd->size
From: Artem Bityutskiy <dedekind@infradead.org>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4A3FBDA2.3070403@gmail.com>
References: <4A3FBDA2.3070403@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 19:17:09 +0300
Message-Id: <1245687429.9487.52.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-22 at 19:21 +0200, Roel Kluin wrote:
> when size_t `len' is negative it is wrapped so the test `len < 0' fails.
> `from' and `to' have type loff_t (signed). During the addition `len' is
> converted to signed. So when `len' is negative `from + len` can be
> less than `mtd->size' while `from' is larger than `mtd->size'. This
> patch fixes this.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>

Thanks, pushed to ubi-2.6.git tree with slightly amended commit message:

commit cf9e1e425172035575bee070df031c8a58015cb8
Author: Roel Kluin <roel.kluin@gmail.com>
Date:   Mon Jun 22 19:21:38 2009 +0200

    UBI: fix input parameters check in gluebi

    size_t `len' is unsigned `len < 0' always fails.
    `from' and `to' have type loff_t (signed). During the addition `len' is
    converted to signed. So when `len' is negative `from + len` can be
    less than `mtd->size' while `from' is larger than `mtd->size'. This
    patch fixes this.

    Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
