Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9JL8-0002Qp-GN
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 13:38:49 +0000
Subject: Re: [PATCH] mtd: Nand Atmel: add On Flash BBT support
From: Artem Bityutskiy <dedekind@infradead.org>
To: simon polette <spolette@gmail.com>
In-Reply-To: <72795ccb0905270300p7ac111fduba8d656a8031a96c@mail.gmail.com>
References: <72795ccb0905250844w13ed9798me95d70614050f676@mail.gmail.com>
	<1243323142.21646.129.camel@localhost.localdomain>
	<72795ccb0905260240q6389dd35j681dbe50a6d4990f@mail.gmail.com>
	<1243331031.21646.134.camel@localhost.localdomain>
	<72795ccb0905260247p6c204cc4w78eaafd28ffc3cf8@mail.gmail.com>
	<72795ccb0905260321n3b4646brb9adc90425b5304b@mail.gmail.com>
	<72795ccb0905260455x701ea6e9u5bafc7c394609a4b@mail.gmail.com>
	<1243405314.11172.5.camel@localhost.localdomain>
	<72795ccb0905270300p7ac111fduba8d656a8031a96c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 May 2009 16:37:27 +0300
Message-Id: <1243431447.11172.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel@lists.arm.linux.org.uk, spolette@adetelgroup.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-27 at 12:00 +0200, simon polette wrote:
> Hoping the patch is correct now :

Did you that test this driver with on-flash BBT? Does it
work? Did you try marking/un-marking blocks bad? I'm just
curious.

I added your patch to my l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
