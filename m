Received: from py-out-1112.google.com ([64.233.166.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KXgId-000741-L7
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 17:56:20 +0000
Received: by py-out-1112.google.com with SMTP id a73so1625073pye.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Aug 2008 10:56:18 -0700 (PDT)
Subject: Having trouble with MTD partition on NOR flash
From: "C.K. Lim" <lim.chongkean@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2008 10:56:13 -0700
Message-Id: <1219686973.2964.11.camel@testpc.toroki.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, 

﻿i compile .dts thru make that create uImage, .dtb (blob) file the
problem that bothers me is when i   
#cat /proc/mtd
no mtd partition shows in the NOR flash, instead it has only mtd0 (one
whole piece of flash) in physmap0.map. i've tried commandline
parser, .config with MTD partition support
any idea?

thanks,
ck
