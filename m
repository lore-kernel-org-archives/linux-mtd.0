Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfzWF-0006q6-Ia
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 22:31:56 +0000
To: Valentin Longchamp <valentin.longchamp@keymile.com>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Possible race condition when accessing SPI NOR Flash ?
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
In-reply-to: <53623597.8040909@keymile.com>
References: <53623597.8040909@keymile.com>
Date: Fri, 02 May 2014 00:31:26 +0200
Message-Id: <20140501223126.E4CD63809A5@gemini.denx.de>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Holger Brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org,
 Stefan Bigler <stefan.bigler@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Valentin,

In message <53623597.8040909@keymile.com> you wrote:
>
> Now when fw_setenv ([1], [2]) updates the environment variables, it sometimes
> (approximately 1 out of 100 runs) triggers such kernel errors:
...
> I see the same behavior with both the 2013.10 and the 2014.04 releases of
> u-boot/fw_env. The kernel we are using is 3.10.36.
> 
> I suspect that the problem is related to SPI NOR/m25p80 driver: on the system we
> have a NAND Flash device with UBI volumes. If I create 2 ubi volumes on the NAND
> Flash and configure fw_setenv (/etc/fw_env.config) to use them instead of the
> the mtd devices targetting the s25fl256s1, I am not able to reproduce the
> problem, even over more than 10'000 runs.

Um... this is _Linux_ crashing - at this point the U-Boot driver has
nothing to do with it..  If there is a problem, then with the Linux
kernel / driver code.  I guess you should rather post this on the MTD
mailing ist.

> One other possible culprit that I see is the fsl_espi.c driver for the
> underlying hardware connection from the CPU to the NOR Flash, but I wanted to
> ask here if someone had an idea about what's going wrong.

It's Linux code....

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Don't hit a man when he's down - kick him; it's easier.
