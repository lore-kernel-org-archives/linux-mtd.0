Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MSOeA-0001By-SA
	for linux-mtd@lists.infradead.org; Sun, 19 Jul 2009 05:09:19 +0000
Subject: Re: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi nand
	driver support
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Jul 2009 08:08:59 +0300
Message-Id: <1247980139.11353.194.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-17 at 12:13 -0700, Leo (Hao) Chen wrote:
> This patch addes bcmring umi nand driver support, with bch ecc algorithm support.
> 
> It addes header files, register files, Kconfig option and Makefile
> entry.
> 
> Signed-off-by: Leo Chen <leochen@broadcom.com>

Hi, the code neat in general, but would it be possible to amend it and
make more compatible with the Linux coding style?

See Documentation/CodingStyle
See scripts/checkpatch.pl

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
