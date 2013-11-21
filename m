Received: from mail-la0-f46.google.com ([209.85.215.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjYJn-0001Yj-No
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 17:45:32 +0000
Received: by mail-la0-f46.google.com with SMTP id eh20so60830lab.19
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 09:45:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
References: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
Date: Thu, 21 Nov 2013 19:45:06 +0200
Message-ID: <CAArO44tOemuo0PyWMuwwGBb77Lt4_pqbDoKWzROLBi0HGC8F7A@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Reuse davinci-nand driver for Keystone arch
From: Taras Kondratiuk <taras.kondratiuk@linaro.org>
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 open list <linux-kernel@vger.kernel.org>,
 Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>,
 linux-mtd@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 November 2013 13:28, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com> wrote:
> This series contains fixes and updates of Davinci nand driver in
> order to reuse it for Keystone platform.
>
> The series is combination of two following series:
> - Davinci nand driver fixes and updates:
>   https://lkml.org/lkml/2013/11/20/271
> - Reuse davinci-nand driver for Keystone arch
>   https://lkml.org/lkml/2013/11/20/315
>
> Ivan Khoronzhuk (10):
>   mtd: nand: davinci: fix driver registration
>   mtd: nand: davinci: return ENOMEM if memory allocation is failed
>   mtd: nand: davinci: check required ti,davinci-chipselect property
>   mtd: nand: davinci: simplify error handling
>   mtd: nand: davinci: move bindings under mtd
>   mtd: nand: davinci: extend description of bindings
>   mtd: nand: davinci: adjust DT properties to MTD generic
>   mtd: nand: davinci: reuse driver for Keystone arch
>   mtd: nand: davinci: don't set timings if AEMIF is used
>   mtd: nand: davinci: don't request AEMIF address range

For all series:
Reviewed-by: Taras Kondratiuk <taras@ti.com>

-- 
Regards,
Taras Kondratiuk
