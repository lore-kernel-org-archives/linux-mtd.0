Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGeKI-000373-6V
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 14:33:14 +0100
Message-ID: <4087C999.4000805@auriga.ru>
Date: Thu, 22 Apr 2004 17:33:13 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: Oliver Korpilla <okorpil@fh-landshut.de>
References: <4087C0EF.7090202@fh-landshut.de>
In-Reply-To: <4087C0EF.7090202@fh-landshut.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel panic on ftl_format
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oliver Korpilla wrote:

> I'm trying to get my Linux to boot its root filesystem from flash
> (JFFS2) on the following hardware:
>
    There's no need in ftl when using jffs2, it is only needed when 
using "traditional" filesystems upon mtds.
    Just mount jffs2 on the block mtd device (don't forget to previously 
erase the device using erase(all) utility) and you're done.

wbr, Dmitry.
