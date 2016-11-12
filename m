Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5gHw-000293-P8
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2016 21:56:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id u144so5313117wmu.0
 for <linux-mtd@lists.infradead.org>; Sat, 12 Nov 2016 13:56:21 -0800 (PST)
Subject: Re: [PATCH 00/11] mtd: nand: denali: first round of cleanups of
 Denali NAND driver
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Dinh Nguyen
 <dinguyen@altera.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a76529fd-d56e-6a73-aa21-af100c837bd9@gmail.com>
Date: Sat, 12 Nov 2016 22:41:58 +0100
MIME-Version: 1.0
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/09/2016 05:35 AM, Masahiro Yamada wrote:
> I am tackling on this driver to use it for my SoCs.
> The difficulty is a bunch of platform specific stuff
> (more specifically, Intel MRST specific) is hard-coded in this driver.
> 
> I need lots of rework to utilize the driver for generic cases,
> but at the same time, I found the driver code is really dirty,
> lots of unused code, odd comments, etc.
> 
> The first thing I needed to do was to clean up the code.
> My work is still under the way, but I decided to drop this series
> for now.  I hope this series is easy to review, so I guess
> splitting into a small chunks is better than a one-shot patch bomb.

Thanks ! except for minor nits, the series looks great!


-- 
Best regards,
Marek Vasut
