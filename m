Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LSnzt-0003k6-1h
	for linux-mtd@lists.infradead.org; Fri, 30 Jan 2009 07:41:08 +0000
Subject: Re: [PATCH] UBI: ioctl instead of CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sidney Amani <seed@uffs.org>
In-Reply-To: <1233047506-30435-1-git-send-email-seed@uffs.org>
References: <1233047506-30435-1-git-send-email-seed@uffs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jan 2009 09:40:55 +0200
Message-Id: <1233301255.7085.48.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-01-27 at 10:11 +0100, Sidney Amani wrote:
> Introduce a new ioctl UBI_IOCSETPROP to set properties
> on a volume. Also add the first property:
> UBI_PROP_DIRECT_WRITE, this property is used to set the
> ability to use direct writes in userspace
> 
> Signed-off-by: Sidney Amani <seed@uffs.org>
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

FYI, this and the other ioctl patches from Corentin went to
Linus's tree today and will show up in 2.6.29. HTH.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
