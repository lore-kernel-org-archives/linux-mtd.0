Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NNYwi-0003sk-Qm
	for linux-mtd@lists.infradead.org; Wed, 23 Dec 2009 21:40:45 +0000
To: "Darwin Rambo" <drambo@broadcom.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: UBI - exclude bootloader blocks from wear levelling
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: <B125D8217ABC4B43826503DE00A2D44910DFC17927@SJEXCHCCR01.corp.ad.broadcom.com>
References: <4B2FA658.6010407@wyplay.com>
	<20091223063242.B63923F6EF@gemini.denx.de>
	<B125D8217ABC4B43826503DE00A2D44910DFC17927@SJEXCHCCR01.corp.ad.broadcom.com>
Date: Wed, 23 Dec 2009 22:40:01 +0100
Message-Id: <20091223214001.815CD3F6EF@gemini.denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lauren Del Giudice <lauren@wyplay.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear "Darwin Rambo",

please do not top-post / full qoute. See
http://www.netmeister.org/news/learn2quote.html


In message <B125D8217ABC4B43826503DE00A2D44910DFC17927@SJEXCHCCR01.corp.ad.broadcom.com> you wrote:
> I think Lauren must have been referring to a bootloader that lives
> outside the kernel and file system context. For example, a small,
> standalone bootloader downloaded from a serial port to it's own
> partition, would not be known to the kernel, as it is used to launch
> the kernel or later stage bootloaders. In this case it runs
> standalone and can't sit on UBI or be launched by a linux app. If

Of course it can, assuming it is UBI-aware by itself. For example,
U-Boot is such a boot loader that can load the U-Boot image itself
from a UBI partition in NAND.

> this small bootloader was only a block or two in size, and since it
> is typically burned once for production and then becomes read-only
> for each bootup after that, wear levelling is not required or
> possible.

Noite that "read-only" is not sufficient. NAND flash will develop
errors even if you just read it often enough. See for example this
Micron Application Note:
http://download.micron.com/pdf/technotes/nand/tn2917.pdf

> Flash data retention periods are usually specified in years, and

I am not talking about "data retention" here. See section "NAND Flash
is Not a Hard Drive" in the above Application Note to understand what
I mean.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Defaults are wonderful, just like fire.
                  - Larry Wall in <1996Mar6.004121.27890@netlabs.com>
