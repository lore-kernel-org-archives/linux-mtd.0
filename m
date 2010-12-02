Subject: Re: [PATCH 1/3] mtd: FSMC NAND remove PARTITION macro and fix
	compile noise
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@stericsson.com>
In-Reply-To: <1291035126-17770-1-git-send-email-linus.walleij@stericsson.com>
References: <1291035126-17770-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 05:31:24 +0200
Message-ID: <1291260684.14534.3.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-11-29 at 13:52 +0100, Linus Walleij wrote:
> This removes the PARTITION macro that David didn't like and also
> removes a local variable that was dangling unused in some #ifdefs
> by being a bit more clever.
> 
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>

Pushed this to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
