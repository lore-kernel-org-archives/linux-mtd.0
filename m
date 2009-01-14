Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN6F6-0003yT-P9
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 13:57:15 +0000
Subject: Re: Missing ioctl32 for ubi
From: Artem Bityutskiy <dedekind@infradead.org>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <Pine.LNX.4.64.0901141432590.27302@vixen.sonytel.be>
References: <Pine.LNX.4.64.0901141432590.27302@vixen.sonytel.be>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jan 2009 15:57:26 +0200
Message-Id: <1231941446.5973.69.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-14 at 14:48 +0100, Geert Uytterhoeven wrote:
> 	Hi Артём,
> 
> When running ubimkvol (32-bit userland) on a PS3 (ppc64), I get:
> 
> | # ubimkvol /dev/ubi0 -N test -s 200MiB
> | ubimkvol: error!: cannot UBI create volume
> |           error 22 (Invalid argument)
> | #
> 
> and in the kernel log:
> 
> | ioctl32(ubimkvol:2207): Unknown cmd fd(3) cmd(80986f00){t:'o';sz:152} arg(ff88a888) on /dev/ubi0
> 
> This is on 2.6.29-rc1+.

Hmm, frankly I have no idea what this could be. I'll look and try ti
figure out, though.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
