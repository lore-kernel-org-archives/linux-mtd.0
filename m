Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKkYn-0001vO-6l
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 02:23:49 +0000
Received: by rv-out-0708.google.com with SMTP id b17so8721955rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Jan 2009 18:23:48 -0800 (PST)
Message-ID: <f17812d70901071823i59129877rf90e888398c5c6b3@mail.gmail.com>
Date: Thu, 8 Jan 2009 10:23:48 +0800
From: "Eric Miao" <eric.y.miao@gmail.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
Subject: Re: [PATCH 3/3 v2] [MTD] [NAND] pxa3xx_nand.c: Fix compilation
	without MTD partitioning support
In-Reply-To: <1231373200-19248-4-git-send-email-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1231373200-19248-1-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-2-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-3-git-send-email-marcel@ziswiler.com>
	<1231373200-19248-4-git-send-email-marcel@ziswiler.com>
Cc: Marcel Ziswiler <marcel.ziswiler@noser.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 8, 2009 at 8:06 AM, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> This fixes compilation without MTD partitioning support previously failing.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@noser.com>

Acked-by: Eric Miao <eric.miao@marvell.com>
