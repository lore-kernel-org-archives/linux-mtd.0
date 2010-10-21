Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8sZi-0005oO-Kc
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 10:40:47 +0000
Received: by fxm15 with SMTP id 15so3642570fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Oct 2010 03:40:45 -0700 (PDT)
Subject: Re: [PATCH] drivers/mtd/devices/phram.c: Use KBUILD_MODNAME
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
In-Reply-To: <1287596362.1813.205.camel@Joe-Laptop>
References: <1287596362.1813.205.camel@Joe-Laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Oct 2010 13:37:32 +0300
Message-ID: <1287657452.2932.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-20 at 10:39 -0700, Joe Perches wrote:
> Use the more standard #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> No change in output strings.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
