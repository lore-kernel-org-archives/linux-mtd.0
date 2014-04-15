Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wa2v1-0002iu-F5
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 12:56:55 +0000
Message-ID: <1397566573.4441.1.camel@karhu>
Subject: Re: [PATCH] include/common.h: fix build against current uClibc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Apr 2014 15:56:13 +0300
In-Reply-To: <98c2959992086acd792ef9850c90cc9da8a2a063.1397392006.git.baruch@tkos.co.il>
References: <98c2959992086acd792ef9850c90cc9da8a2a063.1397392006.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-04-13 at 15:26 +0300, Baruch Siach wrote:
> Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
> introduced a rpmatch() call. However, uClibc versions older than (not yet
> released) 0.9.34 don't have rpmatch() implementation. Add one.
> 
> Cc: Mike Frysinger <vapier@gentoo.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
