Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C92DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yu5WYca3SnXRIgvnaRSMqRx+/QLYnSZ+8cckVQUALSs=; b=RTXBd+5KMVlp0C
	NsRpWBIdupGlFl7AHoAU7BegS9ZX4b1ZAV+/oAAIMcjD/uSplIKPlXxQi8CSPy/iibwFcFopF65Qv
	xbMd5Xi0DUCdervhe1mPDlv+gmXUryScSHoPEp4kZDkf/0DiV7/D9if88SCRpbl/94uwj8M7/I+kM
	Aa/i8+zXPnJtjlF2xHwo+1bJZ0UHzP8fwR251Wnx7MN3aHGe1H9UWIpzpP+FbcHO7uv/hq8DYp6OW
	2/sP588E9FTTvuYPBh/PAbjeatxY35IyuooPBk8oIMMrOPibFWi/QbUtc0OLAs403NbqdkLRosd8W
	cAHQbSFAZWb108oZmC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYmxZ-008Ffy-7L; Mon, 28 Mar 2022 10:50:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYmxN-008FdX-NS
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 10:50:43 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nYmxK-0006yj-FT; Mon, 28 Mar 2022 12:50:38 +0200
Message-ID: <c807ca8c-3065-cdec-8e2b-5d5a77529c69@pengutronix.de>
Date: Mon, 28 Mar 2022 12:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 0/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Content-Language: en-US
To: Tokunori Ikegami <ikegami.t@gmail.com>, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220323170458.5608-1-ikegami.t@gmail.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_035041_796832_336B410F 
X-CRM114-Status: GOOD (  16.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Tokunori-san,

On 23.03.22 18:04, Tokunori Ikegami wrote:
> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
> check correct value") buffered writes fail on S29GL064N. This is
> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
> write completion, where as, chip_good() check expects actual data
> written to the last location to be returned post DQ polling completion.
> Fix is to revert to using chip_good() for S29GL064N which only checks
> for DQ lines to settle down to determine write completion.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

For this series,

Tested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks a lot for taking care of this. Could you keep me Cc'd
on future revisions? Convention is via a Reported-by tag
in the regression fix.

Cheers,
Ahmad


> 
> Tokunori Ikegami (4):
>   mtd: cfi_cmdset_0002: Move and rename
>     chip_check/chip_ready/chip_good_for_write
>   mtd: cfi_cmdset_0002: Use chip_ready() for write on S29GL064N
>   mtd: cfi_cmdset_0002: Add S29GL064N ID definition
>   mtd: cfi_cmdset_0002: Rename chip_ready variables
> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 112 ++++++++++++++--------------
>  include/linux/mtd/cfi.h             |   1 +
>  2 files changed, 55 insertions(+), 58 deletions(-)
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
