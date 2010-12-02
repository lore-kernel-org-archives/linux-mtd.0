Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO0Bb-0000lK-Jj
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 03:50:25 +0000
Received: by bwz5 with SMTP id 5so7110414bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 19:50:20 -0800 (PST)
Subject: Re: [PATCH v4 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
In-Reply-To: <1291111325-25784-1-git-send-email-savinay.dharmappa@ti.com>
References: <1291111325-25784-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:50:15 +0200
Message-ID: <1291261815.14534.14.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, David Griego <dgriego@mvista.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-11-30 at 15:32 +0530, Savinay Dharmappa wrote:
> From: David Griego <dgriego@mvista.com>
> 
> OMAP-L137/AM17x has limited number of dedicated EMIFA
> address pins, enough to interface directly to an SDRAM.
> If a device such as an asynchronous flash needs to be
> attached to the EMIFA, then either GPIO pins or a chip
> select may be used to control the flash device's upper
> address lines.
> 
> This patch adds support for the NOR flash on the OMAP-L137/
> AM17x user interface daughter board using the latch-addr-flash
> MTD mapping driver which allows flashes to be partially
> physically addressed. The upper address lines are set by
> a board specific code which is a separate patch.
> 
> Signed-off-by: David Griego <dgriego@mvista.com>
> Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

Pushed these to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
