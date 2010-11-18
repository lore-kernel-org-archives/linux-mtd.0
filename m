Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PJ2b1-00023a-Fc
	for linux-mtd@lists.infradead.org; Thu, 18 Nov 2010 11:24:11 +0000
Received: by eyd9 with SMTP id 9so1825061eyd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2010 03:24:03 -0800 (PST)
Message-ID: <4CE50C64.60001@mvista.com>
Date: Thu, 18 Nov 2010 14:22:12 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: Savinay Dharmappa <savinay.dharmappa@ti.com>
Subject: Re: [PATCH v2 1/2] mtd: NOR flash driver for OMAP-L137/AM17x
References: <1289548911-21243-1-git-send-email-savinay.dharmappa@ti.com>
In-Reply-To: <1289548911-21243-1-git-send-email-savinay.dharmappa@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: sshtylyov@ru.mvista.com, amakarov@ru.mvista.com,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org, David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 12-11-2010 11:01, Savinay Dharmappa wrote:

> From: David Griego <dgriego@mvista.com>

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

    Please add back my signoff, omitted in this version. Some of the code, 
including a bug fix, was authored by me.

> Signed-off-by: David Griego <dgriego@mvista.com>

Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>

> Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>

 > diff --git a/include/linux/mtd/latch-addr-flash.h 
b/include/linux/mtd/latch-addr-flash.h
 > new file mode 100644
 > index 0000000..c77e7c9
 > --- /dev/null
 > +++ b/include/linux/mtd/latch-addr-flash.h
 > @@ -0,0 +1,29 @@
 > +/*
 > + * Interface for NOR flash driver whose high address lines are latched
 > + *
 > + * Copyright (C) 2008 MontaVista Software, Inc.<source@mvista.com>
 > + *
 > + * This file is licensed underthe terms of the GNU General Public License
                                  ^
    Oops, forgot a space here.

WBR, Sergei
