Received: from mail-pd0-f174.google.com ([209.85.192.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnE0P-0005pk-Kb
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 20:20:26 +0000
Received: by mail-pd0-f174.google.com with SMTP id 10so10674893pdc.33
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 13:20:02 -0700 (PDT)
From: Kevin Hilman <khilman@linaro.org>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [v4 2/3] arm: gpmc: Low power transition support
References: <1371032708-9242-1-git-send-email-pekon@ti.com>
 <1371032708-9242-3-git-send-email-pekon@ti.com>
Date: Thu, 13 Jun 2013 13:19:58 -0700
In-Reply-To: <1371032708-9242-3-git-send-email-pekon@ti.com> (Pekon Gupta's
 message of "Wed, 12 Jun 2013 15:55:07 +0530")
Message-ID: <87bo79bw5t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon Gupta <pekon@ti.com> writes:

> From: avinash philip <avinashphilip@ti.com>
>
> With GPMC converted to platform driver recently, adds low power
> transition support in driver itself.

The subject/changelog should be clear that this is support for
suspend/resume.

Kevin
