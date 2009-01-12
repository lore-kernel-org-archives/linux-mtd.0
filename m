Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LMGsC-0003Cc-LW
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2009 07:06:09 +0000
Subject: Re: mtd: constify VFTs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jan Engelhardt <jengelh@medozas.de>
In-Reply-To: <alpine.LSU.2.00.0901112354590.20643@fbirervta.pbzchgretzou.qr>
References: <alpine.LSU.2.00.0901112354590.20643@fbirervta.pbzchgretzou.qr>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 12 Jan 2009 09:06:18 +0200
Message-Id: <1231743978.5973.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-01-11 at 23:55 +0100, Jan Engelhardt wrote:
> parent 9850cd2553595f0efa726b0ba45e7b47def8ded2 (v2.6.29-rc1-8-g9850cd2)
> commit 1b4a88617720bf38c46614bf9308ccbb150979bb
> Author: Jan Engelhardt <jengelh@medozas.de>
> Date:   Sun Jan 11 23:55:02 2009 +0100
> 
> mtd: constify VFTs
> 
> Signed-off-by: Jan Engelhardt <jengelh@medozas.de>
> ---

Pushed to ubi-2.6.git tree, thank you.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
