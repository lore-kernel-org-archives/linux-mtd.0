Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NNaoK-0005XJ-D1
	for linux-mtd@lists.infradead.org; Wed, 23 Dec 2009 23:40:13 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "Wolfgang Denk" <wd@denx.de>
Date: Wed, 23 Dec 2009 15:39:52 -0800
Subject: RE: UBI - exclude bootloader blocks from wear levelling
Message-ID: <B125D8217ABC4B43826503DE00A2D44910DFC179CA@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<20091223063242.B63923F6EF@gemini.denx.de>
	<B125D8217ABC4B43826503DE00A2D44910DFC17927@SJEXCHCCR01.corp.ad.broadcom.com>
	<20091223214001.815CD3F6EF@gemini.denx.de>
In-Reply-To: <20091223214001.815CD3F6EF@gemini.denx.de>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lauren Del Giudice <lauren@wyplay.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Of course it can, assuming it is UBI-aware by itself. For example,
> U-Boot is such a boot loader that can load the U-Boot image itself
> from a UBI partition in NAND.
The bootstrap for portable devices might boot up just thousands of time in =
product lifetime, and with strong ECC this seems like a reasonable compromi=
se of simplicity vs complexity. Also my simple bootstrap fits within a sing=
le block, so wear levelling in my case doesn't make much sense. The strong =
ECC seems more suitable for this type of situation. Of course, larger u-boo=
t based bootstraps are better candidates for the wear levelling / UBI appro=
ach as you suggest.

> Noite that "read-only" is not sufficient. NAND flash will develop
> errors even if you just read it often enough. See for example this
> Micron Application Note:
> http://download.micron.com/pdf/technotes/nand/tn2917.pdf
Thanks for the excellent link.

Darwin
