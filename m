Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LpdRZ-0006Zd-Bs
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 07:04:07 +0000
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <kpc.mtd@gmail.com>
In-Reply-To: <a95a62fe0904021641j17a7c26dv5652de4a19bad662@mail.gmail.com>
References: <200903260042.42091.david-b@pacbell.net>
	<a95a62fe0904021641j17a7c26dv5652de4a19bad662@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Apr 2009 10:03:35 +0300
Message-Id: <1238742215.20906.99.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-02 at 16:41 -0700, Kevin Cernekee wrote:
> Here is a follow-up patch to apply on top of David Brownell's original
> MTD driver model patch at:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-March/025005.html
> 
> Changes:
> 
> 1) Add more sysfs attributes: mtd_flags, mtd_size, mtd_erasesize,
> mtd_writesize, mtd_oobsize, mtd_numeraseregions, mtd_name .

Please, do not all the "mtd_" prefix to the file names. This is
redundant information because we already know this is about
mtd from the path.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
