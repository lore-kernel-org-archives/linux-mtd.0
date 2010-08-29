Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Opfiw-0007UH-9Y
	for linux-mtd@lists.infradead.org; Sun, 29 Aug 2010 11:06:58 +0000
Received: by gyg8 with SMTP id 8so2060149gyg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 29 Aug 2010 04:06:53 -0700 (PDT)
Subject: RE: [PATCH 1/3][MTD] P4080/eLBC: Make Freescale elbc interrupt
	common to elbc devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zang Roy-R61911 <r61911@freescale.com>
In-Reply-To: <3850A844E6A3854C827AC5C0BEC7B60A03E044@zch01exm23.fsl.freescale.net>
References: <3850A844E6A3854C827AC5C0BEC7B60A03E044@zch01exm23.fsl.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 14:06:46 +0300
Message-ID: <1283080006.2131.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lan Chunhe-B25806 <B25806@freescale.com>, linuxppc-dev@ozlabs.org,
	akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-09 at 15:33 +0800, Zang Roy-R61911 wrote:
> Any comment about this serial patches?
> If none, I'd ask Andrew to merge to his mm tree.

Could you please separate out MTD stuff, to the extent it is possible to
do?
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
