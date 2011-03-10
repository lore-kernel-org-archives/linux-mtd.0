Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxfsH-0005ke-VJ
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2011 13:25:55 +0000
Received: by bwz1 with SMTP id 1so1995436bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Mar 2011 05:25:52 -0800 (PST)
Subject: Re: [PATCH] cfi: add support for AMIC flashes (e.g. A29L160AT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
In-Reply-To: <1299744312-6291-1-git-send-email-sledz@dresearch.de>
References: <1299744312-6291-1-git-send-email-sledz@dresearch.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Mar 2011 15:24:21 +0200
Message-ID: <1299763461.6676.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-10 at 09:05 +0100, Steffen Sledz wrote:
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    1 +
>  include/linux/mtd/cfi.h             |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
