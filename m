Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma0nN-0007rB-L9
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 05:18:18 +0000
Subject: RE: [PATCH v3 26/27] [ARM] [NAND] [bcmring] add bcmring umi nand
	driver support
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CDD@SJEXCHCCR02.corp.ad.broadcom.com>
References: <8628FE4E7912BF47A96AE7DD7BAC0AADCB25C53608@SJEXCHCCR02.corp.ad.broadcom.com>
	<1247980139.11353.194.camel@localhost.localdomain>
	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CCA@SJEXCHCCR02.corp.ad.broadcom.com>
	<8628FE4E7912BF47A96AE7DD7BAC0AADCB25D06CDD@SJEXCHCCR02.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 08:16:25 +0300
Message-Id: <1249794985.9157.36.camel@localhost>
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

Hi,

On Tue, 2009-07-28 at 15:38 -0700, Leo (Hao) Chen wrote:
>  include/linux/mtd/nand_bcm_umi.h              |  241 ++++++++

It does not look like you need to have this header file in
include/linux/mtd/. Also, this file contains huge inline functions,
which is not nice. We are trying not to make functions longer than
1-2 lines inline and let the compiler do the decisions. Of course,
there are exceptions, but your 'nand_bcm_umi_bch_correct_page' does
not look like this. Could you please go through all your inlines and
un-inline non-few-liners?

Sorry, I do not have time to do any real review, but from the stylistic
POW you have too many
/*********************************************************************/
things, as well as ThisLovelyWindowsStyle naming, which we do not
appreciate very much in the Linux Kernel.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
