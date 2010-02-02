Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcBmQ-0006xW-Ea
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 05:58:35 +0000
Received: by fxm1 with SMTP id 1so2161513fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Feb 2010 21:58:29 -0800 (PST)
Subject: Re: [PATCH] cfi.h: quiet sparse noise
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <201001151109.32890.hartleys@visionengravers.com>
References: <201001151109.32890.hartleys@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 07:58:25 +0200
Message-Id: <1265090305.2517.13.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-15 at 11:09 -0700, H Hartley Sweeten wrote:
> cfi.h: quiet sparse noise
> 
> In the inline function cfi_build_cmd_addr, the cast of cmd_ofs to an
> uint8_t produces a sparse warning of the type:
> 
> warning: cast truncates bits from constant value (2aa becomes aa)
> 
> Quiet the warning by masking cmd_ofs with 0xff and remove the cast.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Pushed this one to my l2-mtd-2.6 / master
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
