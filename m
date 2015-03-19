Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYdSI-0001vA-Hu
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 16:37:59 +0000
Received: by pacwe9 with SMTP id we9so80378612pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2015 09:37:37 -0700 (PDT)
Message-ID: <550AFB29.9040403@gmail.com>
Date: Thu, 19 Mar 2015 09:36:57 -0700
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/4] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
References: <1426733358-15596-1-git-send-email-computersforpeace@gmail.com>
 <1426733358-15596-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1426733358-15596-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/03/15 19:49, Brian Norris wrote:
> This core originated in Set-Top Box chips (BCM7xxx) but is used in a
> variety of other Broadcom chips, including some BCM63xxx, BCM33xx, and
> iProc/Cygnus. It's been used only on ARM and MIPS SoCs, so restrict it
> to those architectures.
> 
> There are multiple revisions of this core throughout the years, and
> almost every version broke register compatibility in some small way, but
> with some effort, this driver is able to support v4.0, v5.0, v6.x, v7.0,
> and v7.1. It's been tested on v5.0, v6.0, v7.0, and v7.1 recently, so
> there hopefully are no more lurking inconsistencies.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
