Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKURI-0001Rh-IU
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 11:52:22 +0000
Subject: Re: [PATCH 1/4] mtd: m25p80: Add Numonyx m25px32 family
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <657440bd74a74686279e691d39337f21@localhost>
References: <657440bd74a74686279e691d39337f21@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:48:48 +0300
Message-ID: <1305200928.2713.98.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-05-08 at 10:47 -0700, Kevin Cernekee wrote:
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 3fb981d..09c342d 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c

Pushed all 4 patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
