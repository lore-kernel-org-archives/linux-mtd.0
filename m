Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DpR29-0001g3-74
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 09:30:50 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <0IJ200CBRX00K2@mmp2.samsung.com>
References: <0IJ200CBRX00K2@mmp2.samsung.com>
Content-Type: text/plain
Date: Mon, 04 Jul 2005 17:30:12 +0400
Message-Id: <1120483812.16978.38.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'Woodruff, Richard'" <r-woodruff2@ti.com>, "'Johnson,
	Steve-OMAP'" <stevej@ti.com>, 'Dongjun Shin' <d.j.shin@samsung.com>,
	linux-omap-open-source@linux.omap.com, "'Zhang,
	Jian'" <jzhang@ti.com>, linux-mtd@lists.infradead.org,
	'Thomas Gleixner' <tglx@linutronix.de>
Subject: Re: [PATCH] OneNAND MTD support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-04 at 10:19 +0900, Kyungmin Park wrote:
> Hi
> 
> We are happy to release OneNAND MTD to open source community.
Hello,

+config MTD_ONENAND_VERIFY_WRITE
+       bool "Verify OneNAND page writes"
+       depends on MTD_ONENAND
+       help
+         This adds an extra check when data is written to the flash.
The
+         OneNAND flash device internally checks only bits transitioning
+         from 1 to 0. There is a rare possibility that even though the
+         device thinks the write was successful, a bit could have been
+         flipped accidentaly due to device wear or something else.

Why general MTD  CONFIG_MTD_NAND_VERIFY_WRITE config option and -
>verify_buf driver method (see nand_base.c) is not enough and you need
your own verify option?
