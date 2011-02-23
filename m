Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ps6P9-0006Ma-IZ
	for linux-mtd@lists.infradead.org; Wed, 23 Feb 2011 04:32:49 +0000
Received: by ewy23 with SMTP id 23so1399455ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Feb 2011 20:32:45 -0800 (PST)
Subject: Re: UBI power cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marco Cesarano <mcesaran@broadcom.com>
In-Reply-To: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>
References: <2B8D104E6375C044820294EF730F789F582C219247@IRVEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Feb 2011 06:32:39 +0200
Message-ID: <1298435559.2431.2.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-22 at 14:21 -0800, Marco Cesarano wrote:
> Hi,
> 
> I tested UBI/UBIFS on Linux 2.6.31 and I experienced some issues in
> case of power cut. I've pasted some logs below. You can see that the
> driver returns a code that means that a page is partially written on
> the flash, and at the boot phase the driver detects corrupted data.

Do you still have this corrupted media? Could you please enable UBIFS
debugging and reproduce the issue and send the UBIFS logs? This may
help: http://linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
