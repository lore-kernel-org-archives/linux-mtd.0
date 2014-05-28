Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpfBU-0002bs-4H
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 14:50:28 +0000
Received: by mail-lb0-f177.google.com with SMTP id s7so5902387lbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 07:50:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1398785391-10744-1-git-send-email-grmoore@altera.com>
References: <1398785391-10744-1-git-send-email-grmoore@altera.com>
Date: Wed, 28 May 2014 09:50:03 -0500
Message-ID: <CA+iBjpRnjpd1kWZV=xe_p9=G-fJWvgPKnJjPa95t2o8fGwf=2A@mail.gmail.com>
Subject: Re: [PATCH V4] Add support for flag status register on Micron chips.
From: Graham Moore <ggrahammoore@gmail.com>
To: Graham Moore <grmoore@altera.com>
Content-Type: text/plain; charset=UTF-8
Cc: ZY - marex <marex@denx.de>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Insop Song <insop.song@gainspeed.com>, Alan Tull <atull@altera.com>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 29, 2014 at 10:29 AM, Graham Moore <grmoore@altera.com> wrote:
> Some new Micron flash chips require reading the flag
> status register to determine when operations have completed.
[...]

Are there any other comments I should address to make this patch acceptable?

Thanks,
-Graham
